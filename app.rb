require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'mongo_mapper'
require 'mustache/sinatra'
require 'redcarpet'
require './models/life_log'
require './views/view_helpers'
Dir["./lib/*.rb"].each {|file| require file }

MongoMapper.database = 'life_log'

class App < Sinatra::Base
  register Mustache::Sinatra
  require './views/layout'

  set :mustache, { :views => './views', :templates => './templates/' }
  
  get '/' do
    @life_logs = LifeLog.all(:order => :created_at.desc)
    mustache :index
  end

  get '/new' do
    @life_log = LifeLog.new
    mustache :new
  end

  post '/create' do
    @life_log = LifeLog.create(params[:log_entry])
    redirect '/'
  end

  get '/export' do
    file = ExportPosts.export
    send_file file.path, :type => 'application/zip',
                             :disposition => 'attachment',
                             :filename => 'life-log-backup.zip'
  end


  get '/:id' do
    @life_log = LifeLog.find(params[:id])
    mustache :show
  end

  get '/:id/edit' do
    @life_log = LifeLog.find(params[:id])
    mustache :edit
  end

  get '/:id/delete' do
    @life_log = LifeLog.find(params[:id])
    @life_log.delete
    redirect '/'
  end

  post '/:id' do
    @life_log = LifeLog.find(params[:id])
    @life_log.update_attributes(params[:log_entry])
    mustache :show 
  end


end



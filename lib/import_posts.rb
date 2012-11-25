require './app'
require 'mongo_mapper'

class ImportPostV1
  
  def self.import(files)
    files.each do |file|
      i = ImportPostV1.new(file)
      i.save
    end
    nil
  end

  def initialize(file)
    @lines = File.open(file).readlines
    setup
  end

  def setup
    @date = DateTime.parse(@lines.shift)
    @date = @date.change(offset: "-0700")
    @body = @lines.join('')
  end

  def save
    lifeLog = LifeLog.new
    lifeLog.author = "Ryan Mathews"
    lifeLog.body = @body
    lifeLog.created_at = @date
    lifeLog.save
  end
end

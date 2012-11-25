class LifeLog
  include MongoMapper::Document

  key :body, String
  key :author, String
  
  timestamps!

 
  # Export to YAML Front Matter
  # Just handles the converstion to a string. 
  # Assumes external function to write to file.
  #
  # https://github.com/mojombo/jekyll/wiki/YAML-Front-Matter
  def to_yaml_front_matter
    yaml_fm = "---\n"
    attr = self.attributes
    attr = attr.delete_if { |key, value| key == "body" }
    attr.each do |key, value|
      yaml_fm += "#{key}: #{value}\n"
    end
    yaml_fm += "---\n"
    yaml_fm += self.body
    yaml_fm
  end
end

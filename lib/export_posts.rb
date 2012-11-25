require 'zip/zip'

class ExportPosts

  def self.export
    # Grab all life logs
    life_logs = LifeLog.all

    # Unique file name
    t = File.new("./public/life-log-#{Time.now.to_i}.zip","w")
    # Create a zip file
    Zip::ZipOutputStream.open(t) do |z|
      # Loop through each log, adding it to the zip
      life_logs.each do |life_log|

        # Make a unique file name for log
        file_name = life_log.created_at.localtime.strftime("%Y-%m-%d-#{life_log._id}.md")
        
        # Add file to zip
        z.put_next_entry(file_name)
        # Write to the new file
        z.write(life_log.to_yaml_front_matter)
      end
    end

    t
  end
end

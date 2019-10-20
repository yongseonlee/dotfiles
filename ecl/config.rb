Eclair.configure do |config|
  config.aws_region = "ap-northeast-1"
 
  config.columns = 4
 
  config.ssh_username = lambda do |image|
    case image.name
 
    when /ubuntu/i
      "ubuntu"
    else
      fallback = "ec2-user"
      msg = "Cannot infer ssh username of image e[33m#{image.name}e[0m. Fallback to e[33m#{fallback}e[0m"
      STDERR.puts STDERR.isatty ? msg : msg.gsub(/\e\[([;\d]+)?m/, '')
      fallback
    end
  end
 
   
  config.ssh_keys = {
  }
 
  config.ssh_ports = [22]
 
  config.ssh_options = "-o ConnectTimeout=1 -o StrictHostKeyChecking=no"
end


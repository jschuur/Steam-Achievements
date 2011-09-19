# Initialize redis
$redis = Redis.new(:host => 'localhost', :port => 6379)

# Load YAML config file for the active environment
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

#
APP_NAME = "Steamy Data"
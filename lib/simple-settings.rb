require "simple-settings/version"
require 'logger'
require 'yaml'

class Hash
  def symbolize_keys
    arr = {}
    self.each do |k,v|
      if v.is_a? Hash
        arr[k.to_sym] = v.symbolize_keys
      else
        arr[k.to_sym] = v
      end
    end
    arr
  end
end
module SimpleSettings
  @env = false
  @file_path = false
  @config = {}
  class << self
    attr_accessor :config, :file_path, :env
    def load
      begin
        @config = YAML::load(File.open(file_path))[env].symbolize_keys
      rescue
        l = Logger.new(STDERR)
        l.error "Failed loading settings file: #{file_path} for env: #{env}"
        @config = {}
      end
    end

    def file_path
      return @file_path if @file_path
      return @file_path = Rails.root.join('config','settings.yml') if Rails.root
    end

    def env
      return @env if @env
      return @env = Rails.env if defined?(Rails)
      return @env = false
    end
  end
end

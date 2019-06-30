require 'gcaptcha/version'
require 'gcaptcha/gcaptcha'
require 'gcaptcha/config'
require 'gcaptcha/errors/configuration'

module GCaptcha
  class << self
    def configure
      config = GCaptcha::Config.instance
      yield config
    end

    def config
      GCaptcha::Config.instance.configuration
    end

    def generate
      code, img_data = get_captcha_data
      output_file = File.join(config[:img_path], "#{code}.#{config[:extension_name]}")
      File.open(output_file, 'wb') do |file|
        file.write(img_data)
      end
      output_file
    end

    def batch_generate
      paths = []
      config[:batch_nums].to_i.times do
        paths << generate
      end
      paths
    end

    private

    def get_captcha_data
      style = config[:style] == :colorful ? 1 : 0
      length = config[:length]

      unless (3..10).include?(length)
        raise GCaptcha::Errors::Configuration, 'length config error, value must in 3..10'
      end

      strike_through = config[:strike_through] ? 1 : 0
      outline = config[:outline] ? 1 : 0
      self.create(style, length, strike_through, outline)
    end
  end
end
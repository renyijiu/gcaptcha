require 'singleton'

module GCaptcha
  class Config
    include Singleton

    # Color style, default: :colorful, allows: [:colorful, :black_white]
    attr_accessor :style

    # Chars length: default 5, allows: [3..7]
    attr_accessor :length

    # strike_through, default: true
    attr_accessor :strike_through

    # outline style for the hard mode, default: true
    attr_accessor :outline

    # batch generate captcha, default: 10
    attr_accessor :batch_nums

    # img output path, default: same with gem path
    attr_accessor :img_path

    # image's extension name, allows: [:jpg, :png, :gif], default: :jpg
    attr_accessor :extension_name

    def configuration
      @config ||= {}.tap do |config|
        config[:style] = style || :colorful
        config[:length] = length || 5
        config[:strike_through] = strike_through.nil? ? true : strike_through
        config[:outline] = outline.nil? ? true : outline
        config[:batch_nums] = batch_nums || 10
        config[:img_path] = img_path || Dir.pwd
        config[:extension_name] = extension_name || :jpg
      end
    end
  end
end
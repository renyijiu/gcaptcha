require 'test_helper'

class GCaptchaTest < Minitest::Test
  def test_should_has_version_number
    refute_nil ::GCaptcha::VERSION
  end

  def test_should_get_config
    config = GCaptcha.config

    assert config[:style]
    assert config[:length]
    assert config[:strike_through]
    assert config[:outline]
    assert config[:batch_nums]
    assert config[:img_path]
    assert config[:extension_name]
  end

  def test_should_set_config
    Singleton.__init__(GCaptcha::Config)
    batch_nums = rand(20..100)

    GCaptcha.configure do |config|
      config.batch_nums = batch_nums
    end

    config = GCaptcha.config
    assert_equal batch_nums, config[:batch_nums]
  end

  def test_should_generate_captcha
    file_path = GCaptcha.generate

    assert File.file?(file_path)
    File.delete(file_path)
  end
end

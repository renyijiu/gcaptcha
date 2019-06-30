$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "gcaptcha"
require "minitest/autorun"

tmp_path = File.join(File.dirname(__FILE__), '../tmp')
Dir.mkdir(tmp_path) unless File.exist?(tmp_path)
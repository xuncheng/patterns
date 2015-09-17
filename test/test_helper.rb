Dir.chdir File.expand_path("../../", __FILE__)
$LOAD_PATH.unshift ".", "lib", "test"

require "minitest/autorun"
require "minitest/pride"

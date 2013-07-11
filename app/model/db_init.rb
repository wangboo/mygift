module Mygift
  require "active_record"
  require "yaml"
  db_config = YAML.load(File.new($pro_path + "config/database.yml"))
  ActiveRecord::Base.establish_connection db_config
  models = Dir.new($app_path + "model/")
  models.each do |model|
    load "#{$app_path}/model/#{model}" unless model == "." || model == ".." || model == "db_init.rb"
  end
end
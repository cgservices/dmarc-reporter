# Rails environment
set :rails_env, "production"

# Servers settings
server "webruby01.cg.nl", :app, :web, :db, :primary => true
server "webruby02.cg.nl", :app, :web

# RVM configuration
set :rvm_ruby_string, "RUBYVERSION@#{application}"
set :rvm_type, :system

# Deploy location / code
set :deploy_to, "#{application}"
set :deploy_via, :remote_cache
set :branch, "production"

# Extra environment options
set :normalize_asset_timestamps, false

# SSH options to host
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :default_shell, "bash -l"

# Extra environment options
set :default_environment, {'LANG' => 'en_US.UTF-8'}
set :normalize_asset_timestamps, false

# Database config
set :database_config, {
  :adapter => "mysql2",
  :username => "root",
  :host => "db_writer.int.cg.nl",
  :development => "dev_#{application}",
  :test => "test_#{application}",
  :staging => "acc_#{application}",
  :production => "#{application}"
}

set :user, "deploy"
set :runner, "deploy"
set :group, "deploy"
set :use_sudo, false

#Overrule passenger settings
require 'rdeploy/recipes/default_with_database'
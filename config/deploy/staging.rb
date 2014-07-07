# Rails environment
set :rails_env, "staging"

# Servers settings
server "webruby.cg.lan", :app, :web, :db, :primary => true

# RVM configuration settings
set :rvm_ruby_string, "ruby-2.1.1@#{application}"
set :rvm_type, :system
set :rvm_install_with_sudo, true

# Deploy settings
set :deploy_to, "/data/#{application}"
set :deploy_via, :remote_cache
set :branch, "master"

# SSH settings
ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :default_shell, "bash -l"

# Extra environment options
set :normalize_asset_timestamps, false

# Database config
set :database_config, {
    :adapter => "mysql2",
    :username => "root",
    :host => "10.0.0.216",
    :development => "dev_dmarc",
    :test => "test_dmarc",
    :staging => "acc_dmarc",
    :production => "dmarc"
}

set :user, "deployer"
set :runner, "deployer"
set :group, "deployer"
set :use_sudo, false

#Overrule passenger settings
require 'rdeploy/recipes/default_with_database'


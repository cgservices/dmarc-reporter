# ======================================
# = Base deploy script for application =
# ======================================
# Run with: bundle exec cap STAGE deploy
# ======================================
require 'bundler/setup'
require 'rdeploy/recipes/default_with_database'

set :stages, %w(staging production)
set :default_stage, "staging"
set :application, "dmarc-reporter"
set :scm, "git"
set :scm_verbose, true
set :repository, "git@github.com:/cgservices/#{application}.git"
set :git_enable_submodules, 1

# colors
log_formatters = [
  { :match => /command finished/,      :color => :hide,    :priority => 10 },
  { :match => /executing command/,     :color => :blue,    :priority => 10, :style => :underscore },
  { :match => /^transaction: commit$/, :color => :magenta, :priority => 10, :style => :blink }
]
log_formatter(log_formatters)


# use local template instead of included one with capistrano-maintenance
#set :maintenance_template_path, 'app/views/admin/maintenance.html.erb'

# disable the warning on how to configure your server
#set :maintenance_config_warning, false
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

# Project specific deploy actions
namespace(:custom) do

  # Assets commands
  namespace :assets do

    # link the new application release public/assets folder to the ruby_static /assets folder
    desc "Create a symlink from public/assets to ruby_static/assets"
    task :create_symlink, :roles => :db do
      run "ln -nfs #{ruby_static_path}/assets #{release_path}/public/"
    end

    # Task to removes outdated assets
    desc "Remove outdated assets on Master server (db)"
    task :clean_expired, :roles => :db do
      run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} RAILS_GROUPS=assets assets:clean_expired"
    end

    # By default Rails will create fingerprinted files and non-fingerprinted files when you have digest set to true.
    # It's not actually running the entire precompile task twice, it's just running one task for each situation.
    desc "Precompiling assets on Master server (db)"
    task :precompile, :roles => :db do
      run "cd #{release_path} && #{rake} RAILS_ENV=#{rails_env} assets:precompile"
    end

    # Removes the public/assets directory so that we can copy the (compiled) assets from the ruby_static directory to the application directory
    desc "Remove public/assets symlink so we can copy all the assets from ruby_static/assets to public/assets"
    task :remove_symlink, :roles => :db do
      run "rm -rf #{release_path}/public/assets"
    end

    # Copy the precompiled assets from the share to the local application server.
    desc "Copy precompiled assets from share to application map"
    task :copy, :roles => :app do
      run "sudo /root/bin/clear_nfs.sh ; cp -rf #{ruby_static_path}/assets #{release_path}/public/"
    end
  end

end
# new assets precompile flow
before "deploy:create_symlink", "custom:assets:create_symlink"
before "deploy:create_symlink", "custom:assets:clean_expired"
before "deploy:create_symlink", "custom:assets:precompile"
before "deploy:create_symlink", "custom:assets:remove_symlink"
before "deploy:create_symlink", "custom:assets:copy"


before "deploy:create_symlink", "custom:assets:copy"

# default images copy (not assets)
after "deploy:create_symlink", "custom:images:symlink"
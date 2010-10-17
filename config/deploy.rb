# Bundler Integration
# http://github.com/carlhuda/bundler/blob/master/lib/bundler/capistrano.rb
require 'bundler/capistrano'

# Application Settings
set :application, "rr10-team-303"
set :user, "deploy"
set :password, "RailsRumble2010"
set :deploy_to, "/home/#{user}/#{application}"
set :rails_env, "production"
set :use_sudo, false
set :keep_releases, 5

# Git Settings
set :scm, :git
set :branch, "master"
set :repository, "git@github.com:railsrumble/rr10-team-303.git"
set :deploy_via, :remote_cache

# Uses local instead of remote server keys, good for github ssh key deploy.
ssh_options[:forward_agent] = true

# Server Roles
role :web, "173.255.227.50"
role :app, "173.255.227.50"
role :db, "173.255.227.50", :primary => true

# Passenger Deploy Reconfigure
namespace :deploy do
  desc "Restart passenger process"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
 
  [:start, :stop].each do |t|
    desc "#{t} does nothing for passenger"
    task t, :roles => :app do ; end
  end

  desc "Symlink configuration files"
  task :symlink_configs, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_configs'
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require 'rvm/capistrano'

set :application, "steam"

set :rvm_ruby_string, 'ruby-1.9.2-p180'
set (:deploy_to) {"/home/jschuur/apps/#{application}"}

set :repository,  "git@git.joostschuur.com:steam-achievements.git"
set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache

set :use_sudo, false            
set :user, "jschuur"

role :web, "nicky.joostschuur.com"                          # Your HTTP server, Apache/etc
role :app, "nicky.joostschuur.com"                          # This may be the same as your `Web` server
role :db,  "nicky.joostschuur.com", :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(release_path, '.bundle')
    run("mkdir -p #{shared_dir} && ln -s #{shared_dir} #{release_dir}")
  end

  task :install, :roles => :app do
    run "cd #{release_path} && bundle install"

    on_rollback do
      if previous_release
        run "cd #{previous_release} && bundle install"
      else
        logger.important "no previous release to rollback to, rollback of bundler:install skipped"
      end
    end
  end

  task :bundle_new_release, :roles => :db do
    bundler.create_symlink
    bundler.install
  end
end

after "deploy:rollback:revision", "bundler:install"
after "deploy:update_code", "bundler:bundle_new_release"

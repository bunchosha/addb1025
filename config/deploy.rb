lock '3.2.1'

shared_path="/var/www/addb1025/shared"

set :application, 'addb1025'
set :repo_url, 'git@github.com:bunchosha/addb1025.git'
set :branch, 'master'
set :deploy_to, '/var/www/addb1025'
set :scm, :git
set :log_level, :debug
set :pty, true
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5

set :unicorn_pid, "/var/www/addb1025/shared/tmp/pids/unicorn.pid"



after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end




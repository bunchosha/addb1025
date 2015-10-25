set :stage, :staging
set :unicorn_rack_env, "staging"
set :branch, 'dev'
set :rails_env, 'staging'
set :migration_role, 'db'
 
role :app, %w{ec2-user@54.199.154.48} # 実際のサーバのIPアドレスを指定します。
role :web, %w{ec2-user@54.199.154.48}
role :db, %w{ec2-user@54.199.154.48}
 
set :ssh_options, {
keys: [File.expand_path('~/.ssh/adbdtest.pem')],
forward_agent: true,
auth_methods: %w(publickey)
}
 
server '54.199.154.48', user: 'ec2-user', roles: %w{web app db}
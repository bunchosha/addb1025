

set :rails_env, "staging"
set :unicorn_rack_env, "staging"

role :app, %w{ec2-user@54.199.154.48} # 実際のサーバのIPアドレスを指定します。
role :web, %w{ec2-user@54.199.154.48}
role :db, %w{ec2-user@54.199.154.48}

server '54.199.154.48', user: 'ec2-user', roles: %w{web app db}

 
set :ssh_options, {
keys: [File.expand_path('~/.ssh/adbdtest.pem')],
forward_agent: true,
auth_methods: %w(publickey)
}
 


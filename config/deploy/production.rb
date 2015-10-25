
set :stage, :production
set :rails_env, 'production'

role :app, %w{ec2-user@54.178.197.128} # 実際のサーバのIPアドレスを指定します。
role :web, %w{ec2-user@54.178.197.128}
role :db, %w{ec2-user@54.178.197.128}

server '54.178.197.128', user: 'ec2-user', roles: %w{app db}

 
set :ssh_options, {
keys: [File.expand_path('~/.ssh/adbdtest.pem')],
forward_agent: true,
auth_methods: %w(publickey)
}
 


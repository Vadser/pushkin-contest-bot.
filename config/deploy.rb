# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"
set :application, "pushkin"
set :repo_url, "https://github.com/Vadser/pushkin-contest-bot..git"
set :deploy_to, "/var/www/pushkin"
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
set :pty, false

append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :ssh_options, { :forward_agent => true }

set :rvm_ruby_version, '2.4.1'

set :puma_preload_app, true
set :puma_init_active_record, true
#set :puma_bind, "unix:///var/www/pushkin/shared/sockets/puma.sock"

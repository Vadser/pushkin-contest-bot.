# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
environment 'production'
daemonize false

pidfile '/var/www/pushkin/shared/tmp/sockets/puma.pid'
state_path '/var/www/pushkin/shared/tmp/sockets/puma.state'

# stdout_redirect 'log/puma.log', 'log/puma_err.log'

# quiet
threads 0, 16
bind 'unix:///var/www/pushkin/shared/tmp/sockets/puma.sock'

# ssl_bind '127.0.0.1', '9292', { key: path_to_key, cert: path_to_cert }

# on_restart do
#   puts 'On restart...'
# end

# restart_command '/u/app/lolcat/bin/restart_puma'


# === Cluster mode ===

# workers 2

# on_worker_boot do
#   puts 'On worker boot...'
# end

# === Puma control rack application ===

activate_control_app 'unix:///var/www/pushkin/shared/tmp/sockets/pumactl.sock'

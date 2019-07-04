threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

port        ENV.fetch("PORT") { 3000 }

environment ENV.fetch("RAILS_ENV") { "production" }
root_dir = Dir.pwd
pidfile File.join(root_dir, "tmp", "pids", "puma.pid")
state_path File.join(root_dir, "tmp", "pids", "puma.state")

workers ENV.fetch("WEB_CONCURRENCY") { 2 }


preload_app!


stdout_redirect '/usr/local/rails_app/blog/log/puma.error.log', '/usr/local/rails_app/blog/log/puma.access.log', true


bind 'unix:///usr/local/rails_app/blog/tmp/sockets/blog-puma.sock'
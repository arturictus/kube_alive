KubeAlive.setup do |config|
  redis do
    { host: 'my_redis_server' }
  end

  service :sidekiq do
    port 7433
    ttl 600 # 10 minutes
    adapter :redis, liveness_key: 'asdfasdf'
    on_start do
      # will do all the redis setup in the adapter
      # send initial job
    end
    on_success do
      # Problem:
      # kube liveness ckeck can be too often to do
      # an on success in the server

      # Http.get(snitch)
    end
    on_error do
      # send email
    end
    on_stop do
      #
    end
  end

  service :racecar do
    port 7223
    ttl 600 # 10 minutes
    adapter :file_system, filename: 'dfjdkfjkd.alive'
    on_success do
      # Http.get(snitch)
    end
    on_error do
      # send email
    end
  end
end

# Add to your process
# KubeAlive.start(:sidekiq)

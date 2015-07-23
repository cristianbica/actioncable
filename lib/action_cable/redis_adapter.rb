module ActionCable
  class RedisAdapter < AbstractAdapter
    delegate :publish, to: :backend
    delegate :subscribe, :unsubscribe_proc, :unsubscribe, to: :pubsub

    protected
      def backend
        @backend ||= EM::Hiredis.connect(config.redis[:url]).tap do |redis|
          redis.on(:reconnect_failed) do
            logger.info "[ActionCable] Redis reconnect failed."
            # logger.info "[ActionCable] Redis reconnected. Closing all the open connections."
            # @connections.map &:close
          end
        end
      end

      def pubsub
        redis.pubsub
      end
  end
end

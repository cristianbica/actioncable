module ActionCable
  class AbstractAdapter
    def publish(channel, message)
      raise NotImplementedError, "Subclasses must implement a render publish"
    end

    def subscribe(channel, proc = nil, &block)
      raise NotImplementedError, "Subclasses must implement a subscribe method"
    end

    def unsubscribe_proc(channel, proc)
      raise NotImplementedError, "Subclasses must implement a unsubscribe_proc method"
    end

    def unsubscribe(channel)
      raise NotImplementedError, "Subclasses must implement a unsubscribe method"
    end
  end
end

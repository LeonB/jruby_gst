class Gst::Bus
  attr_accessor :java_bus
  
  def initialize(pipeline)
    self.java_bus = pipeline.java_element.get_bus()
  end
  
  #TODO: review if this is smart to do! I don't think so, but I don't know a better/other way
  #TODO: how 'bout multiple callbacks? 5 minutes later: wait a minute.... doesn't gstreamer-java doesn't take care of that?
  def connect(*options, &f)
    
    if options.is_a? Array
      new_options = {}
      options.each do |option|
        if option.is_a? Gst::MessageType
          new_options[:type] = option
        #elsif method option
        else
          new_options[:method] = option
        end
      end
      options = new_options
    end
    
    #Parse the arguments
    {:method => nil, :type => 'MESSAGE'}.merge!(options)
    
    #Create a gstreamer_java message type
    message_type = options[:type].to_java

    callback = message_type.impl do |*args|      
      m = Gst::Message.new(args)
      
      if block_given?
        connect_with_block(m, &f)
      elsif options[:method]
        connect_with_method(options[:method], m)
      else
        raise 'You should give a method or block as parameter'
      end
    end
    
    java_bus.connect(callback)
  end
  
  def connect_with_block(message, &f)
    f.call(message)
  end
  
  def connect_with_method(method, message)
    send(method, message)
  end
  
end
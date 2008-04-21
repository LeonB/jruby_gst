class Gst::Element
  attr_accessor :java_element, :bus
  
  #def initialize(factory_name, name)
  def initialize()
    #TODO: based on the factory_name create a specific objet? For example filesrc?
    
    #self.java_element = JavaGst::ElementFactory.make(factory_name, name)
    #self.java_element = JavaGst::Element.new()
  end
  
  #This one is only for inputrc
  def location=(location)
    self.java_element.location = location
  end
  
  #This one is only for capsfilter
  def set_caps(caps)
    return false if not caps.is_a? Gst::Caps
    
    self.java_element.set_caps(caps.java_caps)
  end
  
  def >>(another_element)
    #TODO: dit moet misschien net allemaal andersom?
    self.java_element.link(another_element.java_element)
    return another_element
  end
  
  def self.link_many(*elements)
    
    elements.each_with_index do |element, i|
      break if i+1 == elements.length
      next_element = elements[i+1]
      
      element >> next_element
    end
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
    
    print "#{callback.inspect}\n"
    print "#{callback.java_class}\n"
    
    java_element.connect(callback)
  end
  
  def bus
    @bus ||= Gst::Bus.new(self)
  end
  
  def connect_with_block(message, &f)
    f.call(message)
  end
  
  def connect_with_method(method, message)
    send(method, message)
  end
  
end
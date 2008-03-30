include Java
#require '/home/leon/Workspaces/rmpd/rmpd_player/ext/gstreamer-java-0.6.jar'
require '/home/leon/src/gstreamer-java/trunk/dist/gstreamer-java.jar'

module JavaGst
  include_package 'org.gstreamer'
end

module Gst
  def self.init(progname = __FILE__, *args)
    args = args.to_java(:string)
    
    JavaGst::Gst.init(progname, args)
  end
end

class Gst::Pipeline
  attr_accessor :java_pipeline
  attr_reader :bus
  
  def initialize(name)
    self.java_pipeline = JavaGst::Pipeline.new(name)
  end
  
  def add(*elements)
    java_elements = elements.collect { |element| element.java_element }
    java_elements = java_elements.to_java(:java.org.gstreamer::Element)
    java_pipeline.add_many(java_elements)
  end
  
  def bus
    @bus ||= Gst::Bus.new(self)
  end
  
  def play
    java_pipeline.play
  end
  
  def pause
    java_pipeline.pause
  end
  
  def stop
    java_pipeline.stop
  end
  
end

class Gst::Bus
  attr_accessor :java_bus
  
  def initialize(pipeline)
    self.java_bus = pipeline.java_pipeline.get_bus()
  end
  
  def add_watch(&f)

    callback = JavaGst::Bus::MESSAGE.impl do |*args|      
      m = Gst::Message.new(args)
      
      f.call(m)
    end
    
    java_bus.connect(callback)
  end
  
end

class Gst::ElementFactory
  def self.make(factory_name, name)
    Gst::Element.new(factory_name, name)
  end
end

class Gst::Message
  attr_accessor :bus, :message
  
  def initialize(args)
    #self.args = args
    self.bus = args[1]
    self.message = args[2]
  end
  
  def get_type
    
  end
  
  def parse_tag
    raise 'Not yet implemented!'
  end
  
end

class Gst::MessageType
  
  def self.all
    JavaGst::MessageType.constants.grep(/^[A-Z]*$/)
  end

  Gst::MessageType.all.each do |type|
    const_set type, Gst::MessageType.new
  end
end

class Gst::Element
  attr_accessor :java_element
  
  def initialize(factory_name, name)
    raise 'Gst.init must be called before creating an element!' if JavaGst::Gst.get_main_context.nil?
    
    self.java_element = JavaGst::ElementFactory.make(factory_name, name)
  end
  
  def location=(location)
    self.java_element.location = location
  end
  
  def >>(another_element)
    #TODO: dit moet misschien net allemaal andersom?
    self.java_element.link(another_element.java_element)
    return another_element
  end
end
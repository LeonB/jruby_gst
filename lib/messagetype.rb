class Gst::MessageType
  #The types are now: ["LATENCY", "APPLICATION", "BUFFERING", "UNKNOWN", "EOS", "ELEMENT", "SIGNALS", "ERROR", "INFO", "DURATION", "TAG", "ANY", "WARNING", "MESSAGE"]
  
  attr_accessor :type
  
  def self.all
    types = JavaGst::MessageType.constants.grep(/^[A-Z]*$/)
    types << 'MESSAGE'
  end
  
  def initialize(type)
    self.type = type
  end
  
  def to_s
    self.type.to_s
  end
  
  def to_java
    eval("JavaGst::Bus::#{type.to_s}")
  end

  Gst::MessageType.all.each do |type|
    const_set type, Gst::MessageType.new(type)
  end
end
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
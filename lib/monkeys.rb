#Because the initialize() is not super'ed, I have to check if Gst is initialized this way

class org.gstreamer::ElementFactory
  meta_eval do
    alias_method :make_orig, :make
  end
  
  def self.make(*args)
    raise 'Gst.init must be called before creating an element!' if not Gst.initialized?
    make_orig(*args)
  end
end

class org.gstreamer.elements::PlayBin
  alias_method :initialize_orig, :initialize
  def initialize(*args)
    #raise 'Gst.init must be called before creating an element!' if not Gst.initialized?
    initialize_orig(*args)
  end
end
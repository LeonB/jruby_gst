#Because the initialize() is not super'ed, I have to check if Gst is initialized this way

class org.gstreamer::ElementFactory
  def self.make(*args)
    raise 'Gst.init must be called before creating an element!' if not Gst.initialized?
    super(args)
  end
end

class org.gstreamer.elements::PlayBin
  def self.new(*args)
    raise 'Gst.init must be called before creating an element!' if not Gst.initialized?
    super(args)
  end
end
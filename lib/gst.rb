class Gst
  
  def self.init(progname = __FILE__, args = ARGV)
    args = args.to_java(:string)
    
    JavaGst::Gst.init(progname, args)
  end
  
  def self.initialized?
    !JavaGst::Gst.get_main_context.nil?
  end
  
  def self.version
    JavaGst::Gst.version.to_s
  end
  
  def self.quit
    JavaGst::Gst.quit()
  end
  
  def self.deinit
    JavaGst::Gst.deinit()
  end
end
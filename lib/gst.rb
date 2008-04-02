class Gst
  
  def self.init(progname = __FILE__, args = ARGV)
    args = args.to_java(:string)
    
    JavaGst::Gst.init(progname, args)
  end
  
  def self.version
    JavaGst::Gst.version.to_s
  end
end
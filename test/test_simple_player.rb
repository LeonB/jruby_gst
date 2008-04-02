load '/home/leon/Workspaces/jruby_gst/jruby_gst.rb'
Gst.init
pipeline = Gst::Pipeline.new("my_pipeline")
filesrc = Gst::ElementFactory.make("filesrc", "my_disk_source")
filesrc.location = "/home/leon/Music/Bennie Hek & De Houdoe's/Mega Melige Zeebra-Rock/Bennie Hek & De Houdoe's - Mega Melige Zeebra-Rock - 01 - Intro.mp3"
decoder = Gst::ElementFactory.make("mad", "my_decoder")
convertor = Gst::ElementFactory.make("audioconvert", "convertor")
audiosink = Gst::ElementFactory.make("autoaudiosink", "my_audio_player")
pipeline.add(filesrc, decoder, convertor, audiosink)

messages = []
pipeline.bus.add_watch { | message | messages << message }
filesrc >> decoder >> convertor >> audiosink
pipeline.play


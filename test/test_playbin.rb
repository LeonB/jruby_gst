#!/usr/bin/env jruby

load '/home/leon/Workspaces/jruby_gst/jruby_gst.rb'

class Player
  attr_accessor :playlist
  attr_accessor :playbin
  
  def initialize
    Gst.init('rmpd')
    
    self.playbin = Gst::Playbin.new('rmpd')
    playbin.bus.connect(Gst::MessageType::EOS) do |message|
      #playbin.state = Gst
      playbin.state = Gst::State::NULL
      self.play_next_song()
      print "#{message.inspect}\n"
    end
    
    playbin.bus.connect(Gst::MessageType::ERROR) do |error|
      print "I got an error: #{error.inspect}\n"
    end
    
    playlist << "/home/leon/Downloads/nog_te_bewerken/coin.wav"
    playlist << "/usr/share/sounds/error.wav"
    playlist << "/usr/share/sounds/phone.wav"
    playlist << "/home/leon/Music/Bennie Hek & De Houdoe's/Mega Melige Zeebra-Rock/Bennie Hek & De Houdoe's - Mega Melige Zeebra-Rock - 01 - Intro.mp3"
  end
  
  def playlist
    return @playlist ||= []
  end
  
  def play
    #if !playbin.playing?
      play_next_song
    #end
  end
  
  def play_next_song
    if playlist.length > 0
      f = self.playlist.shift
      self.playbin.file = f;
      playbin.play()
    else
      self.stop()
    end
  end
  
  def pause
    playbin.pause
  end
  
  def stop
    playbin.stop
    Gst.quit() #If you wanna quit
    Gst.deinit()
  end
end

#Now play!
p = Player.new
p.play
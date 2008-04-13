= jruby_gst

* https://github.com/LeonB/jruby_gst/

== DESCRIPTION:

jruby bindings for gstreamer. These bindings make use of gstreamer-java (http://gstreamer-java.googlecode.com)

== FEATURES/PROBLEMS:

* Runs on jruby
* Based on gstreamer 0.10
* Very simple API

== SYNOPSIS:

  FIX (code sample of usage)

== REQUIREMENTS:

* jruby > 1.1 RC3
* gstreamer (with good, bad and ugly repositories)
* gstreamer-java.jar (0.6 included)

== INSTALL:

* gem install jruby_gst

== TODOS:

  #TODO: decide: java native functions in ruby caps or java caps?
  #TODO: if there's a specific elementclass: initalize it instead of the default Element (inputsrc for example)
  #TODO: make a to_java() for arrays

== LICENSE:

(The MIT License)

Copyright (c) 2008

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

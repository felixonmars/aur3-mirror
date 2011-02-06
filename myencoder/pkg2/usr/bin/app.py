#!/usr/bin/env python
import gtk
import gtk.glade
import os

class myApp:
    def __init__(self):
        gladefile = "gui2.glade"
        window = "window1"
        self.widgets = gtk.glade.XML(gladefile, window)
        dic = { "on_startencode_clicked" : self.button1clicked,
                "on_window1_destroy" : gtk.main_quit }
        self.widgets.signal_autoconnect(dic)
    
    def runcommand(self, inputfile, outputfile, vcodec, vbitrate, framerate, resx, resy, \
               aspect, acodec, abitrate):
        size = resx + "x" + resy
        abitrate = str(abitrate)
        vbitrate = str(vbitrate)
        framerate = str(framerate)

        if acodec == "Vorbis":
            aencoder = "vorbis"
        elif acodec == "MP3":
            aencoder = "libmp3lame"
        elif aencoder == "WAV":
            aencoder = "pcm_s16le"

        if vcodec == "XVID":
            vencoder = "mpeg4 -vtag xvid"
        elif vcodec == "x264":
            vencoder = "libx264"
        elif vcodec == "MPEG4":
            vencoder = "mpeg4"

        command = "ffmpeg -i " + inputfile + " -vcodec " + vencoder + " -b " + vbitrate + \
              " -r " + framerate + " -s " +  size + " -aspect " + aspect + " -acodec " + \
              aencoder + " -ab " + abitrate + " " + outputfile
        print command
        os.system(command)

    def button1clicked(self, self2):
        inputfileraw = self.widgets.get_widget("inputfile")
        inputfile = inputfileraw.get_text()
        outputfileraw = self.widgets.get_widget("outputfile")
        outputfile = outputfileraw.get_text()
        vidcodecraw = self.widgets.get_widget("vidcodec")
        vidcodec = vidcodecraw.get_active_text()
        framerateraw = self.widgets.get_widget("framerate")
        framerate = framerateraw.get_active_text()
        xresraw = self.widgets.get_widget("xres")
        xres = xresraw.get_text()
        yresraw = self.widgets.get_widget("yres")
        yres = yresraw.get_text()
        aspectratioraw = self.widgets.get_widget("aspectratio")
        aspectratio = aspectratioraw.get_active_text()
        vbitrateraw = self.widgets.get_widget("vbitrate")
        vbitrate = vbitrateraw.get_active_text()
        acodecraw = self.widgets.get_widget("acodec")
        acodec = acodecraw.get_active_text()
        abitrateraw = self.widgets.get_widget("abitrate")
        abitrate = abitrateraw.get_active()
        self.runcommand(inputfile, outputfile, vidcodec, \
                          vbitrate, framerate, xres, yres, \
                          aspectratio, acodec, abitrate)
        

app = myApp()
gtk.main()

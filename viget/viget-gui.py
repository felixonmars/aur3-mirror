#!/usr/bin/python2
# -*- coding: UTF-8 -*-
#Licence: GPLv3.0
#Copyright: Krasimir S. Stefanov <lokiisyourmaster@gmail.com>

import os
import platform
import sys
import os.path
import pygtk
pygtk.require("2.0")
import gtk
import gtk.glade
import gobject
import re
import pango
import asubprocess
#from subprocess import Popen, PIPE, STDOUT
import signal
import cairo
import atk
import pangocairo
import gtk.gdk
import shlex
import urllib
from optparse import OptionParser
import time
import ConfigParser
import locale
import gettext
from threading import Thread
from functions import *
from cStringIO import StringIO
from gzip import GzipFile

pluginspath = os.path.join(os.getenv('HOME') or os.getenv('USERPROFILE'),".viget", "viget_update.py")
import viget
if os.path.isfile(pluginspath):
    sys.path.append(os.path.dirname(pluginspath))
    try:
        import viget_update
        if viget_update.PLUGINS_VER > viget.PLUGINS_VER:
            viget = viget_update
            print "using newer version"    
        else:
            print "using current version"    
    except:
        print "error while trying to use new version" 
        pass

print viget.PLUGINS_VER

# localization
APP = "viget"
APP_VERSION = "0.2.5"
DIR = localedir()

gtk.glade.bindtextdomain(APP, DIR)
gtk.glade.textdomain(APP)
gettext.bindtextdomain(APP, DIR)
gettext.textdomain(APP)
gettext.install(APP, localedir=DIR)
_ = gettext.gettext
# /localization

gobject.threads_init()

def check_version():
    try:
        html = urllib.urlopen('http://viget.learnfree.eu/version.txt').read()
    except:
        return 0
    
    try:
        NEW_PLUGINS_VER = re.search('PLUGINS_VER=(.*)', html).group(1)
        NEW_PLUGINS_REQ = re.search('PLUGINS_REQ=(.*)', html).group(1)
        NEW_APP_VERSION = re.search('APP_VERSION=(.*)', html).group(1)
    except:
        return 0
        
    if NEW_APP_VERSION > APP_VERSION:
        if NEW_PLUGINS_VER > viget.PLUGINS_VER:
            if APP_VERSION < NEW_PLUGINS_REQ:
                # нова програма, нови плъгини. изисква се пълна актуализация
                return 1
            else:
                # нова програма, нови плъгини. възможна е частична актуализация, препоръчва се пълна
                return 2
        else:
            # нова програма, няма нови плъгини, препоръчва се пълна актуализация
            return 3
    else:
        if NEW_PLUGINS_VER > viget.PLUGINS_VER:
            if APP_VERSION >= NEW_PLUGINS_REQ:
                # нови плъгини. възможна е частична актуализация
                return 4
            else:
                # нови плъгини. изисква се пълна актуализация за тях
                return 5
    return 0

class UpdaterThread(Thread):
    def __init__ (self, callback_done):
        super(UpdaterThread, self).__init__()
        self.callback_done = callback_done
        
    def run(self):
        vercheck = check_version()
        if vercheck == 2 or vercheck == 4:
            try:
                pygz = urllib.urlopen('http://viget.learnfree.eu/viget.py.gz').read()
                py = GzipFile('','r',0,StringIO(pygz)).read()
            except:
                gobject.idle_add(self.callback_done, -1)
                return
            
            if not os.path.exists(os.path.dirname(pluginspath)):
                os.makedirs(os.path.dirname(pluginspath))
            f = open(pluginspath, 'w+')
            f.write(py)    
            f.close()

        gobject.idle_add(self.callback_done, vercheck)

            
class app:
    def __init__(self):

        self.pathname = os.path.dirname(sys.argv[0])
        self.abspath = os.path.abspath(self.pathname)
        self.gladefile = self.abspath + "/viget-gui.glade"
        self.window1 = gtk.glade.XML(self.gladefile,"window1",APP)
        self.downloader = None
        self.ns = None
        
        dic = {
            "on_button1_clicked" : self.on_button1_clicked,
            "on_button2_clicked" : self.on_button2_clicked,
            "on_button3_clicked" : self.on_button3_clicked,
            "on_button5_clicked" : self.on_button5_clicked,
            "on_button6_clicked" : self.on_button6_clicked,
            
            "on_entry1_changed" : self.on_entry1_changed,
            "on_combobox2_changed" : self.on_combobox2_changed,
            "on_window1_delete_event" : self.on_button3_clicked
        }
        
        self.settings = {}
        
        self.window1.signal_autoconnect (dic)
        

        self.window1.get_widget("filechooserbutton1").set_current_folder(os.getenv('HOME') or os.getenv('USERPROFILE'))
        self.combobox_maketext(self.window1.get_widget("combobox1"))
        self.combobox_maketext(self.window1.get_widget("combobox2"))    
        
        config = ConfigParser.ConfigParser()
        config.readfp(open(os.path.join(self.abspath,'templates.ini')))
        
        templates = config.options('Templates')
        templates.insert(0, _('Disabled'))
        self.combobox_populate(self.window1.get_widget("combobox2"), templates)
        
        parser = OptionParser()
        parser.add_option("-i", "--video-url", action="store", type="string", dest="video_url", help=_("Video URL"))
        parser.add_option("-d", "--download", action="store_true", dest="download", default=False, help=_("Auto start download"))
        parser.add_option("-o", "--output-dir", action="store", type="string", dest="output_dir", help=_("Output directory"))
        
        (self.arguments, args) = parser.parse_args()

        if self.arguments.output_dir:
            self.window1.get_widget("filechooserbutton1").set_current_folder(self.arguments.output_dir)

        if self.arguments.video_url:
            self.window1.get_widget("entry1").set_text(self.arguments.video_url)

        
        while gtk.events_pending():
            gtk.main_iteration_do()

        self.window1.get_widget("window1").show()
            
        if self.arguments.download:
            if not self.arguments.video_url:
                print _("ERROR: No video url specified!")
                sys.exit(1)
            else:
                if self.downloader:
                    self.on_button1_clicked(None)
                else:
                    print _("ERROR: Invalid URL!")
                    sys.exit(1)    
                    
        UpdaterThread(self.vercheck_done).start()
            
    def vercheck_done(self, result):
        if result == -1:
            pass # plugins download failed
        elif result == 1 or result == 5:
            self.msg_info(_("There is a new version of viGet available! It supports some new sites, and it's recommended to download it.\nGo to %s for more info.") %
                '<a href="http://skss.learnfree.eu">http://skss.learnfree.eu</a>')
        elif result == 2:
            self.msg_info(_("The list of supported sites has been automatically updated! It works with the current version of viGet well, so it's not nesessary to download newer version of the program.\n<b>It's nesessary to restart viGet now.</b>"))                
        elif result == 3:
            self.msg_info(_("There is a new version of viGet available! It's recommended to download it.\nGo to %s for more info.") %
                '<a href="http://skss.learnfree.eu">http://skss.learnfree.eu</a>')                
        elif result == 4:
            self.msg_info(_("The list of supported sites has been automatically updated!\n<b>It's nesessary to restart viGet now.</b>"))
        
    
    def on_filechooserbutton1_file_set(self, widget):
        folder = os.path.dirname(self.window1.get_widget("filechooserbutton1").get_filename())
        self.window1.get_widget("filechooserbutton2").set_current_folder(folder)
        return
            
    def on_button1_clicked(self, widget):
        video_url = self.window1.get_widget("entry1").get_text()
        if not video_url:
            self.msg_error(_('No video url specified!'))
            return
            
        if not self.downloader:
            self.msg_error(_('Invalid URL!'))
            return

        if self.downloader.video_urls:
            output_dir = self.window1.get_widget("filechooserbutton1").get_current_folder()
            selected_url = self.window1.get_widget("combobox1").get_active()
            url = self.downloader.video_urls[selected_url]
            name = url[2]
            output_filename = os.path.join(output_dir, name)
            download_result = self.download(url[0], url[1], output_filename.encode(sys.getfilesystemencoding(), 'replace'), video_url)
            if download_result == 0:
                if self.window1.get_widget("combobox2").get_active() > 0:
                    config = ConfigParser.ConfigParser()
                    config.readfp(open('templates.ini'))
                    cmdline = config.get('Templates', self.window1.get_widget("combobox2").get_active_text())
                    cmdline = cmdline.replace('$input', output_filename).replace('$output', output_filename)
                    convert_status = self.convert(cmdline.encode(sys.getfilesystemencoding(), 'replace'))
                    if convert_status == 0:
                        self.msg_notify(_('Conversion complete!'))
                    if self.window1.get_widget("checkbutton2").get_active() and convert_status == 0:
                        os.remove(output_filename.encode(sys.getfilesystemencoding(), 'replace'))
                if self.downloader.subs and self.window1.get_widget("checkbutton1").get_active():
                    name_subs = (os.path.splitext(os.path.join(output_dir, url[2]))[0]+'.srt').encode(sys.getfilesystemencoding(), 'replace')
                    fileObj = open(name_subs,'w+')
                    fileObj.write(self.downloader.subs)
                    fileObj.close()
                
                if self.arguments.download:
                    sys.exit()
                else:
                    self.msg_notify(_('Download complete!'))
            elif download_result == -100:
                pass
            else:
                if self.arguments.download:
                    sys.exit(1)
                else:
                    self.msg_error(_('Download failed!'))
    
                        
    def on_button2_clicked(self, widget):
        about = gtk.AboutDialog()
        about.set_position(gtk.WIN_POS_CENTER_ALWAYS)
        about.set_program_name('viGet')
        about.set_version(APP_VERSION)
        about.set_comments(_('Download videos from the WEB!'))
        about.set_authors([_("Krasimir S. Stefanov <lokiisyourmaster@gmail.com>")])
        about.set_website("http://skss.learnfree.eu/")
        about.set_translator_credits(_("Bulgarian - Krasimir S. Stefanov <lokiisyourmaster@gmail.com>"))
        about.set_logo(gtk.gdk.pixbuf_new_from_file(os.path.join(self.abspath,'viget-logo.png')))
        license = _('''viGet video downloader
Copyright (C) 2010  Krasimir S. Stefanov

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.''')
        
        about.set_license(license)
        about.add_button(_('Supported sites'), 1000)

        response = about.run()
        about.hide()
        if response == 1000:
            listing = []
            for plugin in viget.available:
                #listing.append('<a href="%s">%s</a>' % (plugin.website,plugin.website))
                listing.append(plugin.website)
            listing.sort()
            downloaders = _('viDown supports %(sitecount)d sites: %(sitelist)s') % ({'sitecount': len(listing), 'sitelist': '\n'+'\n'.join(listing)})
            self.msg_multiline(_('Supported sites'), downloaders)
        return
        
    def on_button3_clicked(self, widget, other = None):
        if self.ns:
            if platform.system() == "Windows":
                os.system("taskkill /PID %d /F" % self.ns.process.pid)
            else:
                os.kill(self.ns.process.pid, signal.SIGKILL)
            self.ns.process.wait()
        gtk.main_quit()

    def on_button5_clicked(self, widget, other = None):
        clipboard = gtk.Clipboard()
        index = self.window1.get_widget("combobox1").get_active()
        clipboard.set_text(self.downloader.video_urls[index][1])
        self.msg_info(_('The real video URL was copied to clipboard'))
        
    def on_button6_clicked(self, widget, other = None):
        self.window1.get_widget("entry1").set_text('')
        self.window1.get_widget("entry1").show()
        self.window1.get_widget("entry1").grab_focus()
        self.window1.get_widget("hbox2").hide()
        self.window1.get_widget("checkbutton1").hide()
        self.window1.get_widget("checkbutton1").set_active(False)
            
    def on_entry1_changed(self, widget):
        #self.window1.get_widget("window1").get_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.WATCH)) 
        while gtk.events_pending():
            gtk.main_iteration_do()
        
        
        video_url = self.window1.get_widget("entry1").get_text()
        self.downloader = None
        if not video_url:
            self.window1.get_widget("label2").hide()
            self.window1.get_widget("button1").set_sensitive(False)
        else:            
            for plugin in viget.available:
                d = plugin(video_url)
                if d.detect():
                    self.downloader = d
                    break
            
        if self.downloader:
            self.downloader.get_title()
            
            
            self.window1.get_widget("label2").set_text(self.downloader.website)
            self.window1.get_widget("label2").show()
            self.window1.get_widget("button1").set_sensitive(True)
            
            self.window1.get_widget("entry1").hide()
            self.window1.get_widget("hbox2").show()
            self.window1.get_widget("label5").set_text(self.downloader.title if self.downloader.title else _('Unknown Title'))
            
            formats = []
            if self.downloader.get_video_url():
                for row in self.downloader.video_urls:
                    formats.append(row[0])
                self.combobox_populate(self.window1.get_widget("combobox1"), formats, 0)
            self.downloader.get_subtitles()
            if self.downloader.subs:
                self.window1.get_widget("checkbutton1").show()
                self.window1.get_widget("checkbutton1").set_active(True)
            else:
                self.window1.get_widget("checkbutton1").hide()
                self.window1.get_widget("checkbutton1").set_active(False)
        else:
        
            self.combobox_populate(self.window1.get_widget("combobox1"), [], 0)
            if video_url:
                self.window1.get_widget("label2").set_markup('<span color="red">'+_('Invalid URL!')+'</span>')
                self.window1.get_widget("label2").show()
                self.window1.get_widget("button1").set_sensitive(False)
                self.window1.get_widget("checkbutton1").hide()
        #self.window1.get_widget("window1").get_window().set_cursor(gtk.gdk.Cursor(gtk.gdk.ARROW)) 
    
    def on_combobox2_changed(self, widget):
        if self.window1.get_widget("combobox2").get_active() == 0:
            self.window1.get_widget("checkbutton2").hide()
        else:
            self.window1.get_widget("checkbutton2").show()
    
    
    def download(self, title, remote, local, http_referrer = None):
        if re.match('rtmp://', remote) or re.match('rtmpe://', remote) or re.match('rtmpt://', remote):
            return self.download_rtmp(title, remote, local)
        else:
            return self.download_http(title, remote, local, http_referrer)
    
    
    def download_rtmp(self, title, remote, local):
        if not remote:
            self.msg_error(_("The download link is invalid!"))
            return 1
        self.window1.get_widget("entry1").hide()
        self.window1.get_widget("hbox2").hide()
        self.window1.get_widget("hbox1").show()
        self.window1.get_widget("hbuttonbox1").set_sensitive(False)
        self.window1.get_widget("progressbar1").set_fraction(0.0)
        self.window1.get_widget("progressbar1").set_text(self.downloader.title if self.downloader.title else _('Unknown Title'))
        self.ns = Namespace()
        
        def cancel_process(widget, other = None):
            self.ns.kill_process = True
            return False
        
        self.window1.get_widget("button4").connect("clicked",(cancel_process))

        while gtk.events_pending():
            gtk.main_iteration_do()
            
            
            
        params = remote.split('\t')
        argv = [
            'rtmpdump'
            , '-r', params[0]
            , '-o', local
        ]
        
        for param in params[1:]:
            m = re.search('<playpath>(.*)', param)
            if m:
                argv.append('--playpath')
                argv.append(m.group(1))
                
            m = re.search('<swfUrl>(.*)', param)
            if m:
                argv.append('--swfUrl')
                argv.append(m.group(1))
                
            m = re.search('<pageUrl>(.*)', param)
            if m:
                argv.append('--pageUrl')
                argv.append(m.group(1))
                
        print ' '.join(argv)
        info = None
        if platform.system() == "Windows":
            info = asubprocess.STARTUPINFO()
            info.dwFlags |= asubprocess.STARTF_USESHOWWINDOW
            info.wShowWindow = asubprocess.SW_HIDE

        self.ns.process = asubprocess.Popen(argv, stderr=asubprocess.STDOUT, stdout=asubprocess.PIPE, startupinfo=info)
        self.ns.kill_process = False
        total_size = 0
        while self.ns.process.poll() == None:
            if self.ns.kill_process:
                if platform.system() == "Windows":
                    os.system("taskkill /PID %d /F" % self.ns.process.pid)
                else:
                    os.kill(self.ns.process.pid, signal.SIGKILL)
                self.ns.process.wait()
                try:
                    self.window1.get_widget("hbox2").show()
                    self.window1.get_widget("hbox1").hide()
                    self.window1.get_widget("hbuttonbox1").set_sensitive(True)
                except:
                    pass
                returncode = self.ns.process.returncode
                self.ns = None
                return -100#returncode
                
            else:
                while gtk.events_pending():
                    gtk.main_iteration_do()
                line = self.ns.process.asyncread(0.1)
                m = re.search('\((\d+\.?\d*)%\)$', line)
                if m:
                    try:
                        self.window1.get_widget("progressbar1").set_fraction(float(float(m.group(1))/100.0))
                        self.window1.get_widget("progressbar1").set_text("%s %s%%" % (self.downloader.title, m.group(1)))
                    except:
                        pass
        try:
            self.window1.get_widget("hbox2").show()
            self.window1.get_widget("hbox1").hide()
            self.window1.get_widget("hbuttonbox1").set_sensitive(True)
        except:
            pass        
        returncode = self.ns.process.returncode
        self.ns = None
        return returncode
        
    def download_http(self, title, remote, local, http_referrer = None):
        if not remote:
            self.msg_error(_("The download link is invalid!"))
            return 1
        self.window1.get_widget("entry1").hide()
        self.window1.get_widget("hbox2").hide()
        self.window1.get_widget("hbox1").show()
        self.window1.get_widget("hbuttonbox1").set_sensitive(False)
        self.window1.get_widget("progressbar1").set_fraction(0.0)
        self.window1.get_widget("progressbar1").set_text(self.downloader.title if self.downloader.title else _('Unknown Title'))
        self.ns = Namespace()
        
        def cancel_process(widget, other = None):
            self.ns.kill_process = True
            return False
        
        self.window1.get_widget("button4").connect("clicked",(cancel_process))

        while gtk.events_pending():
            gtk.main_iteration_do()
        argv = [
            'curl'
            , '--cookie-jar', viget.COOKIE_FILE
            , '--user-agent', viget.WebVideoDownloader.user_agent
            , '--url', remote
            , '--output', local
            , '--stderr', '-'
            , '--insecure'
            , '--location'
            , '--header', 'Connection: keep-alive'
        ]
        
        if http_referrer:
            argv.append('--referer')
            argv.append(http_referrer)
        
        if platform.system() != "Windows":
            argv.append('-4')
        #print ' '.join(argv)
        info = None
        if platform.system() == "Windows":
            info = asubprocess.STARTUPINFO()
            info.dwFlags |= asubprocess.STARTF_USESHOWWINDOW
            info.wShowWindow = asubprocess.SW_HIDE

        self.ns.process = asubprocess.Popen(argv, stderr=asubprocess.PIPE, stdout=asubprocess.PIPE, startupinfo=info)
        self.ns.kill_process = False
        total_size = 0
        while self.ns.process.poll() == None:
            if self.ns.kill_process:
                if platform.system() == "Windows":
                    os.system("taskkill /PID %d /F" % self.ns.process.pid)
                else:
                    os.kill(self.ns.process.pid, signal.SIGKILL)
                self.ns.process.wait()
                try:
                    self.window1.get_widget("hbox2").show()
                    self.window1.get_widget("hbox1").hide()
                    self.window1.get_widget("hbuttonbox1").set_sensitive(True)
                except:
                    pass
                returncode = self.ns.process.returncode
                self.ns = None
                return -100#returncode
                
            else:
                while gtk.events_pending():
                    gtk.main_iteration_do()
                line = self.ns.process.asyncread(0.1)
                m = re.search('^\s*(\d+)\s*(\d+\.?\d*[kMG])', line)
                if m:
                    try:
                        self.window1.get_widget("progressbar1").set_fraction(float(float(m.group(1))/100.0))
                        self.window1.get_widget("progressbar1").set_text(_("%(title)s %(percent)s%% of %(total)s") % \
                            ({'title' : self.downloader.title if self.downloader.title else _('Unknown Title')
                            , 'percent' : m.group(1)
                            , 'total' : m.group(2)}))
                    except:
                        pass
        try:
            self.window1.get_widget("hbox2").show()
            self.window1.get_widget("hbox1").hide()
            self.window1.get_widget("hbuttonbox1").set_sensitive(True)
        except:
            pass        
        returncode = self.ns.process.returncode
        self.ns = None
        return returncode

    def convert(self, cmd):
        if not cmd:
            return 1
        print cmd
        self.window1.get_widget("hbox2").hide()
        self.window1.get_widget("hbox1").show()
        self.window1.get_widget("hbuttonbox1").set_sensitive(False)
        self.window1.get_widget("progressbar1").set_fraction(0.0)
        self.window1.get_widget("progressbar1").set_text(_('Converting %d%%') % 0)
        self.ns = Namespace()
        
        def cancel_process(widget, other = None):
            self.ns.kill_process = True
            return False
        
        self.window1.get_widget("button4").connect("clicked",(cancel_process))

        while gtk.events_pending():
            gtk.main_iteration_do()

        argv =  shlex.split(cmd)
        info = None
        if platform.system() == "Windows":
            info = asubprocess.STARTUPINFO()
            info.dwFlags |= asubprocess.STARTF_USESHOWWINDOW
            info.wShowWindow = asubprocess.SW_HIDE

        self.ns.process = asubprocess.Popen(argv, stdout=asubprocess.PIPE, stderr=asubprocess.STDOUT, startupinfo=info)
        self.ns.kill_process = False
        total_size = 0
        duration = 0
        mplayer = re.search('mplayer', argv[0])
        ffmpeg = re.search('ffmpeg', argv[0])
        position = 0
        
        while self.ns.process.poll() == None:
            if self.ns.kill_process:
                if platform.system() == "Windows":
                    os.system("taskkill /PID %d /F" % self.ns.process.pid)
                else:
                    os.kill(self.ns.process.pid, signal.SIGKILL)
                self.ns.process.wait()
                try:
                    self.window1.get_widget("hbox2").show()
                    self.window1.get_widget("hbox1").hide()
                    self.window1.get_widget("hbuttonbox1").set_sensitive(True)
                except:
                    pass
                returncode = self.ns.process.returncode
                self.ns = None
                return -100#returncode
                
            else:
                while gtk.events_pending():
                    gtk.main_iteration_do()
                line = self.ns.process.asyncread(0.1)

                if mplayer:
                    m = re.search('Pos:\s*(.*?)s\s*(\d+)f\s*\(\s*(\d+)%\)\s*(\d*\.?\d*)fps\s*Trem:\s*(\d+(min))\s*\s*(\d+(mb|kb|gb))',line)
                    if m:
                        self.window1.get_widget("progressbar1").set_fraction(float(float(m.group(3))/100.0))
                        self.window1.get_widget("progressbar1").set_text(_('Converting %s%%') % m.group(3))
    
                    else:
                        m = re.search('Generating Index:\s*(\d+)\s*%', line)
                        if m:
                            self.window1.get_widget("progressbar1").set_fraction(float(float(m.group(1))/100.0))
                            self.window1.get_widget("progressbar1").set_text(_('Rebuilding index %s%%') % m.group(1))
                elif ffmpeg:
                    m1 = re.search('duration\s*:\s*(\d+)', line)
                    if m1:
                        duration = float(m1.group(1))
                    
                    m2 = re.search('time=\s*(\d+)', line)
                    if m2:
                        position = float(m2.group(1))    
                                    
                    if duration and position:
                        #percent = int((frame / (duration * framerate)) * 100.0)
                        percent = int((position / duration) * 100.0)
                        self.window1.get_widget("progressbar1").set_fraction(float(percent / 100.0))
                        self.window1.get_widget("progressbar1").set_text(_('Converting %d%%') % percent)
                    else:
                        self.window1.get_widget("progressbar1").set_text(_('Converting...'))
                        self.window1.get_widget("progressbar1").pulse()
                        
                else:
                    self.window1.get_widget("progressbar1").set_text(_('Converting...'))
                    self.window1.get_widget("progressbar1").pulse()
                        
        try:
            self.window1.get_widget("hbox2").show()
            self.window1.get_widget("hbox1").hide()
            self.window1.get_widget("hbuttonbox1").set_sensitive(True)
        except:
            pass        
        returncode = self.ns.process.returncode
        self.ns = None
        return returncode
                
    def msg_error(self,msg):
        dialog = gtk.MessageDialog(self.window1.get_widget("window1"),gtk.DIALOG_MODAL,gtk.MESSAGE_ERROR,gtk.BUTTONS_OK)
        dialog.set_markup(msg)
        dialog.set_position(gtk.WIN_POS_CENTER_ALWAYS)
        dialog.run()
        dialog.destroy()
        
    def msg_info(self,msg):
        dialog = gtk.MessageDialog(self.window1.get_widget("window1"),gtk.DIALOG_MODAL,gtk.MESSAGE_INFO,gtk.BUTTONS_OK)
        dialog.set_markup(msg)
        dialog.set_position(gtk.WIN_POS_CENTER_ALWAYS)
        dialog.run()
        dialog.destroy()    
        
        
    def msg_notify(self, msg):
        try:
            import pynotify
            if pynotify.init(APP):
                n = pynotify.Notification(_('viGet'), msg, 'download')
                n.show()
            else:
                self.msg_info(msg)
        except:
            self.msg_info(msg)    
    
    def combobox_populate(self, cb, items, active = 0):
        cb.get_model().clear()
        for item in items:
            cb.append_text(item)
        cb.set_active(active)
                
    def combobox_select(self, cb, text, col = 0):
        model = cb.get_model()
        iter = model.get_iter_first()
        while iter:
            if model.get_value(iter,col) == text:
                cb.set_active_iter(iter)
                return        
            iter = model.iter_next(iter)
            
    def combobox_maketext(self,cb):
        liststore = gtk.ListStore(str)
        cb.set_model(liststore)
        cell = gtk.CellRendererText()
        cb.pack_start(cell, True)
        cb.add_attribute(cell, 'text', 0)
        
    def msg_multiline(self, title, text):
        def close(widget, other = None):
            ns.window.get_widget("window3").destroy()
        ns = Namespace()
        ns.window = gtk.glade.XML(self.gladefile,"window3" ,APP)
        gtk.glade.bindtextdomain(APP,DIR)
        dic = {
            "on_window3_delete_event" : (close)
            , "on_button9_clicked" :  (close)
        }
        ns.window.signal_autoconnect (dic)
        ns.window.get_widget("textview2").get_buffer().set_text(text)
        ns.window.get_widget("window3").set_title(title)
        ns.window.get_widget("window3").show()

class Namespace: pass

if __name__ == '__main__':
    application = app()
    gtk.main()


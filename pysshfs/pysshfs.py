#!/usr/bin/python2
# -*- coding: utf-8 -*-
##changing: - Add fusermount -z option
#				- Add killall -KILL sshfs after fusermount to kill sshfs process when connection if turned off. unexpectedly (make file manager froze).
#				- Removed mount point in home folder as the unique choice, we can choose whatever folder.
#				- Empty fields as default (expect port)
#				- "Open directory" box unchecked as default
#				- Force mounting in a none empty folder (-o nonempty)
#To do:		- Check/uncheck as default delete mount point when disconnect
#				- Create a button to save profile
##
#   Quick mount sshfs
#
#   by ADcomp <david.madbox@gmail.com>
#      http://www.ad-comp.be/
#
#   This program is distributed under the terms of the GNU General Public License
#   For more info see http://www.gnu.org/licenses/gpl.txt
##

import pexpect
import os
import gtk

VERSION = 0.2
## print debug info ( True / False )
DEBUG = False

class Profil:
    def __init__(self):
        self.clear()
## preremplissage des champs
    def clear(self):
		  #self.user = os.getenv('USER')
        self.user = ''
        self.pwd = ''
        self.host = ''
        self.dir = ''
        self.mountpoint = ''
        self.port = '22'

    def open(self, file):
        self.clear()
        home = os.environ['HOME']
        file_src = "%s/.config/pysshfs/%s.profil" % (home, file)
        if os.access(file_src, os.F_OK|os.R_OK):
            f = open(file_src,'r')
            for line in f:
                if line == '\n' or line[0]=='#':
                    continue
                try:
                    line = line.strip('\n')
                    key, value = line.split('=',1)
                    key = key.strip()
                    value = value.strip()

                    if key == 'user':
                        self.user = value
                    elif key == 'pwd':
                        self.pwd = value
                    elif key == 'host':
                        self.host = value
                    elif key == 'dir':
                        self.dir = value
                    elif key == 'mountpoint':
                        self.mountpoint = value
                    elif key == 'port':
                        self.port = value
                except Exception, e:
                    print "EE : %s" % e
        else:
            print "can't access profil: %s" % profil


class UI:
    def __init__(self):
        # Create window
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_title("Mount sshFS")
        self.window.set_position(gtk.WIN_POS_CENTER)
        self.window.connect("destroy", self.quit)

        if os.access('pysshfs.png', os.F_OK|os.R_OK):
            self.window.set_icon_from_file('pysshfs.png')
        else:
            self.window.set_icon_from_file('/usr/share/pixmaps/pysshfs.png')

        # Containers
        BoxBase = gtk.VBox(False, 0)
        BoxBase.set_spacing(10)
        BoxBase.set_border_width(10)

        BoxMain = gtk.HBox()
        BoxMain.set_spacing(5)
        BoxMain.set_border_width(5)

        BoxControls = gtk.HButtonBox()
        #~ BoxControls.set_spacing(2)
        BoxControls.set_layout(gtk.BUTTONBOX_END)

        # Exit
        button_exit = gtk.Button(stock=gtk.STOCK_CLOSE)
        button_exit.connect("clicked", self.quit)
        BoxControls.pack_end(button_exit, False, False)

        table = gtk.Table()
        table.set_row_spacings(5)
        table.set_col_spacings(5)

        ## Combo Profil
        self.profil_combo = gtk.combo_box_new_text()
        self.profil_combo.append_text('New Connection')

        home = os.environ['HOME']

        if os.path.exists("%s/.config/pysshfs" % home):
            listdir = os.listdir("%s/.config/pysshfs" % home)
            for profil in listdir:
                if '.profil' in profil:
                    self.profil_combo.append_text(profil[:-7])

        self.profil_combo.set_active(0)
        self.profil_combo.connect('changed', self.changed_profil)

        table.attach(self.profil_combo, 0, 2, 0, 1)

        ## User
        self.User_entry = gtk.Entry()

        label = gtk.Label('User :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 1, 2)
        table.attach(self.User_entry, 1, 2, 1, 2)

        ## Password
        self.Password_entry = gtk.Entry()
        self.Password_entry.set_visibility(False)
        label = gtk.Label('Password :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 2, 3)
        table.attach(self.Password_entry, 1, 2, 2, 3)

        ## Host
        self.Host_entry = gtk.Entry()
        label = gtk.Label('Host :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 3, 4)
        table.attach(self.Host_entry, 1, 2, 3, 4)

        ## Dir
        self.Dir_entry = gtk.Entry()
        label = gtk.Label('Dir :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 4, 5)
        table.attach(self.Dir_entry, 1, 2, 4, 5)

        ## Mountpoint
        self.Mountpoint_entry = gtk.Entry()
        label = gtk.Label('Mountpoint :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 5, 6)
        table.attach(self.Mountpoint_entry, 1, 2, 5, 6)

        ## Port
        self.Port_entry = gtk.Entry()
        label = gtk.Label('Port :')
        label.set_alignment(0, 1)
        table.attach(label, 0, 1, 6, 7)
        table.attach(self.Port_entry, 1, 2, 6, 7)

        # Open directory
        self.OpenDir_checkbox = gtk.CheckButton('Open directory')
		  ## cocher/decocher par defaut l'ouverture du dossier
        self.OpenDir_checkbox.set_active(True)
        table.attach(self.OpenDir_checkbox, 0, 1, 7, 8)

        ## Connect
        self.Connect_Bt = gtk.Button(stock=gtk.STOCK_CONNECT)
        self.Connect_Bt.connect("clicked", self.mount_sshfs)
        table.attach(self.Connect_Bt, 1, 2, 7, 8)

        ## Separator
        table.attach(gtk.HSeparator(), 0, 2, 8, 9)

        ## Label
        label = gtk.Label()
        label.set_markup("<b>Mountpoint</b>")
        label.set_alignment(0, 1)
        table.attach(label, 0, 2, 9, 10)

        ## Mounted_FS
        self.Mounted_fs_combo = gtk.combo_box_new_text()
        table.attach(self.Mounted_fs_combo, 0, 2, 10, 11)

        ## Open / Umount
        self.Open_Bt = gtk.Button(stock=gtk.STOCK_OPEN)
        self.Open_Bt.connect("clicked", self.open_mountpoint)
        table.attach(self.Open_Bt, 0, 1, 11, 12)

        self.Umount_Bt = gtk.Button(stock=gtk.STOCK_DISCONNECT)
        self.Umount_Bt.connect("clicked", self.umount_sshfs)
        table.attach(self.Umount_Bt, 1, 2, 11, 12)

## creation du bouton de sauvegarde de profil
		  #self.Umount_Bt = gtk.Button(stock=gtk.STOCK_SAVE)
        #Self.Umount_Bt.connect("clicked", self.save_profile)
		  #table.attach(self.Umount_Bt, 0, 2, 16, 17)

        ## Remove mountpoint
        self.check_remove = gtk.CheckButton('delete mountpoint when disconnect')
        table.attach(self.check_remove, 0, 2, 12, 13)

        ## Separator
        table.attach(gtk.HSeparator(), 0, 2, 13, 14)

        #~ BoxMain.add(table)
        BoxBase.pack_start(table, True)
        BoxBase.pack_end(BoxControls, False)

        self.window.add(BoxBase)
#turn off auto mountpoint
        #self.User_entry.connect("changed", self.auto_mountpoint)
        #self.Host_entry.connect("changed", self.auto_mountpoint)

        self.update_mountedfs()

        self.profil = Profil()
        self.init_entry(self.profil)

        #Show main window frame and all content
        self.window.show_all()

    def init_entry(self, profil):
        self.User_entry.set_text(profil.user)
        self.Password_entry.set_text(profil.pwd)
        self.Host_entry.set_text(profil.host)
        self.Dir_entry.set_text(profil.dir)
        self.Mountpoint_entry.set_text(profil.mountpoint)
        self.Port_entry.set_text(profil.port)

    def changed_profil(self, combobox):
        model = combobox.get_model()
        index = combobox.get_active()

        if index == 0:
            self.profil.clear()
            self.init_entry(self.profil)
        elif index:
            self.profil.open(model[index][0])
            self.init_entry(self.profil)

        return

    def open_profil(self, profil):
        print 'open_profil: %s' % profil
#desactive la creation auto du point de montage
#    def auto_mountpoint(self, widget):
#        User = self.User_entry.get_text()
#        Host = self.Host_entry.get_text()
#        self.Mountpoint_entry.set_text('%s@%s' % (User, Host))

    def open_mountpoint(self, widget):
        mount_point = self.Mounted_fs_combo.get_active()
        if mount_point == 0 or mount_point == -1:
            return
        else:
            os.system('xdg-open %s' % self.Mounted_fs_combo.get_active_text())

    def umount_sshfs(self, widget):
        mount_point = self.Mounted_fs_combo.get_active()
        if mount_point == 0 or mount_point == -1:
            return
        else:
            os.system('fusermount -u -z %s && killall -KILL sshfs' % self.Mounted_fs_combo.get_active_text())
            if self.check_remove.get_active():
                os.rmdir(self.Mounted_fs_combo.get_active_text())
            self.update_mountedfs()
## button ton save profile
    #def save_profile(self, widget):

    def update_mountedfs(self):
        self.mounted_fs_tab = get_mounted_fs()
        self.Mounted_fs_combo.get_model().clear()
        self.Mounted_fs_combo.insert_text(0, 'Choose')

        ind = 1
        for mounted_fs in self.mounted_fs_tab:
            self.Mounted_fs_combo.insert_text(ind, mounted_fs[1])
            ind += 1
        self.Mounted_fs_combo.set_active(0)

    def mount_sshfs(self, widget):
        User = self.User_entry.get_text()
        Password = self.Password_entry.get_text()
        Host = self.Host_entry.get_text()
        Dir = self.Dir_entry.get_text()

        Mountpoint = self.Mountpoint_entry.get_text()
		  #Mountpoint = os.getenv('HOME') + '/' + self.Mountpoint_entry.get_text()

        if not os.path.exists(Mountpoint):
            os.mkdir(Mountpoint)

        Port = self.Port_entry.get_text()

        if User == '' or Password == '' or Host == '' or Mountpoint =='' or Port =='':
            #!FixME
            debug_info('Error : please check your config')
            show_msg('Error : please check your config')
            return

        sshfs = sshFs()
        ret = sshfs.mount(User, Password, Host, Dir, Mountpoint, Port)
        self.update_mountedfs()

        if ret[0] == 0:
            if self.OpenDir_checkbox.get_active():
                os.system('xdg-open %s' % Mountpoint)
        else:
            show_msg(ret[1])

    def run(self):
        gtk.main()

    def quit(self, widget=None, data=None):
        gtk.main_quit()

## Initialize the module.
class sshFs:
    def __init__(self):
        ## Three responses we might expect.
        self.Initial_Responses = ['Are you sure you want to continue connecting (yes/no)?',
                                  'password:', pexpect.EOF]

    def mount(self, User="", Password="", Host="", Dir="", Mountpoint="", Port=22, Timeout=120):

        Command = "sshfs -o allow_other -o nonempty -p %s %s@%s:%s %s" % (Port, User, Host, Dir, Mountpoint)
        debug_info("Command : %s" % Command)

        child = pexpect.spawn(Command)

        ## Get the first response.
        ret = child.expect (self.Initial_Responses, Timeout)
        ## The first reponse is to accept the key.
        if ret==0:
            debug_info("The first reponse is to accept the key.")
            #~ T = child.read(100)
            child.sendline("yes")
            child.expect('password:', Timeout)
            child.sendline(Password)
        ## The second response sends the password.
        elif ret == 1:
            debug_info("The second response sends the password.")
            child.sendline(Password)
        ## Otherwise, there is an error.
        else:
            debug_info("Otherwise, there is an error.")
            return (-3, 'ERROR: Unknown: ' + str(child.before))

        ## Get the next response.
        Possible_Responses = ['password:', pexpect.EOF]
        ret = child.expect (Possible_Responses, Timeout)

        ## If it asks for a password, error.
        if ret == 0:
            debug_info("If it asks for a password, error.")
            return (-4, 'ERROR: Incorrect password.')
        elif ret == 1:
            debug_info("Otherwise we are okay.")
            return (0, str(child.after))
            ## Otherwise we are okay.
        else:
            debug_info("Otherwise, there is an error.")
            return (-3, 'ERROR: Unknown: ' + str(child.before))

def show_msg(msg=' .. '):
    """  """
    message = gtk.MessageDialog(None, gtk.DIALOG_MODAL, gtk.MESSAGE_INFO, gtk.BUTTONS_OK, msg)
    resp = message.run()
    message.destroy()

def get_mounted_fs():
    """ get_mounted_fs() -> reads mtab and returns a list of mounted sshfs filesystems. """
    try:
        mounted_fs = []
        lines = [line.strip("\n").split(" ") for line in open ("/etc/mtab", "r").readlines()]
        for line in lines:
            if line[2] == "fuse.sshfs" and "user=%s" % os.getenv('USER') in line[3]:
                    mounted_fs.append((line[0], line[1]))
        return mounted_fs
    except:
        debug_info("Could not read mtab")
        show_msg("Could not read mtab .. :(")

def debug_info(msg):
    if DEBUG:
        print "# %s" % msg

if __name__ == "__main__":
    ui = UI()
    ui.run()

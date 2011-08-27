#!/usr/bin/python2

import os
import os.path
import sys
import subprocess
from ConfigParser import ConfigParser
from gettext import gettext as _

class DiskImage():
    def __init__(self, image_file = None):
        self.image_file = image_file
        image_name = os.path.basename(self.image_file)
        #Replace any characters that could screw us up.
        self.mount_location = os.path.join(os.path.expanduser('~'), image_name.replace(' ', '_'))
        self.mount_location = self.mount_location.replace('.', '_')
        
    def mount(self):
        if os.path.exists(self.mount_location) and os.listdir(self.mount_location) != []:
            return False
        
        mount_command = "fuseiso -p '%s' '%s'" % (self.image_file, self.mount_location)
        if os.system(mount_command) != 0:
            return False
        else:
            return True
  
        
        
    def umount(self):
        if os.path.exists(self.mount_location):
            unmount_command = "fusermount -u '%s'" % (self.mount_location)
            if os.system(unmount_command) != 0:
                return False
            else:
                return True
        else:
            return False
    
    def burn(self, is_brasero = True):
        try:
            if is_brasero:
                burn_command = "brasero --image '%s'" % (self.image_file)
            else:
                burn_command = "nautilus-cd-burner --source-iso='%s'" % (self.image_file)
            subprocess.Popen(burn_command, shell=True)
        except:
            raise
    
    def browse(self):
        browse_command = "Thunar '%s'" % (self.mount_location)
        try:
            if os.path.exists(self.mount_location):
                subprocess.Popen(browse_command, shell=True)
        except:
            raise


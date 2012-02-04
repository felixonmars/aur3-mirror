#!/usr/bin/python
# vim: filencoding=utf-8 foldmethod=indent
import gettext
_ = gettext.gettext
import locale
locale.setlocale( locale.LC_ALL )
gettext.bindtextdomain( 'text2utf', '/usr/share/locale/' )
gettext.textdomain( 'text2utf' )

import md5
import sys
import urllib
import os
import shutil
import commands

def write2zenity(msg, msg_type='info'):
    'zenity message sink'
    os.system('zenity --%s --text="%s" --title "text2utf"' % (msg_type, msg))

def get_file(msg):
    'zenity "file-input" dialog'
    return commands.getoutput('zenity --file-selection --multiple --separator="|" --title "text2utf"')

def write2stdout(msg, msg_type='info'):
    'stdout message sink'
    print '%s: %s' % (msg_type, msg)

def subconvert(file):
    os.system('dos2unix -U \'%s\'' % file)
    kodowanie=commands.getoutput('/usr/bin/file \'%s\'' % file)
    kodowanie=kodowanie[len(file)+2:]
    iconv_cmd = '/usr/bin/iconv --from-code=%s --to-code=utf-8 --output=\'%s\' \'%s\''
    from_enc = None
    if ('UTF-8 Unicode' in kodowanie):
        pass
    elif ('ISO-8859 text' in kodowanie):
        from_enc = 'iso-8859-2'
    else:
        from_enc = 'Windows-1250'
    if not from_enc is None:
        os.system(iconv_cmd % (from_enc, '%s.tmp' % file , file))
        shutil.move('%s.tmp' % file, file)

class printing:
    def __init__(self):
        self.zenity=0
        self.store=0
        self.storemsginfo=[]
        self.storemsgerror=[]
    def printnow(self, msg, msg_type="info"):
        if (self.zenity==0):
            write2stdout(msg, msg_type)
        else:
            write2zenity(msg, msg_type)
    def pr(self, msg, msg_type="info"):
        if (self.store==0):
            self.printnow(msg, msg_type)
        else:
            if (msg_type=="info"):
                self.storemsginfo.append(msg)
            elif (msg_type=="error"):
                self.storemsgerror.append(msg)
    def printstored(self):
        if (self.store==1):
	    if (len(self.storemsginfo)>0):
	    	self.printnow('\n'.join(self.storemsginfo), "info")
	    if (len(self.storemsgerror)>0):
		self.printnow('\n'.join(self.storemsgerror), "error")
	    self.store=0

pr=printing()
def printout (msg, msg_type='info'):
    pr.pr(msg, msg_type)	   
 
if 'zenity' in sys.argv[1:]:
    pr.zenity=1

mname, filenames = '', [s for s in sys.argv[1:] if s != 'zenity']
if not filenames:
     if (pr.zenity==1):
	filenames = get_file(_('Chose text file to convert.')).split("|")
	if not filenames[0]:
	    sys.exit(2)
     else:
	printout(_('Chose text file to convert.'), 'error')
	sys.exit(2)
if (len(filenames)>1):
    pr.store=1
for i in range(len(filenames)):
    mname = filenames.pop(0)
    if not os.path.isfile(mname):
        printout( _('File:')+" %s " % (mname)+_('not exist!'), 'error')
        continue
    
    filesize = os.path.getsize(mname)
    if filesize > 80000:
        printout(_('Chosed file is too big!')+" %sMB" % (filesize/(1024*1024) ) )
        continue

    subconvert('%s' % mname)
    printout(_('Convertet file:')+" %s." % (os.path.basename(mname)) )

pr.printstored()
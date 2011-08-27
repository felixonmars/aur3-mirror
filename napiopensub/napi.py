#!/usr/bin/python
# vim: filencoding=utf-8 foldmethod=indent
import gettext
_ = gettext.gettext
import locale
locale.setlocale( locale.LC_ALL )
gettext.bindtextdomain( 'napi', '/usr/share/locale/' )
gettext.textdomain( 'napi' )

import md5
import sys
import urllib
import os
import shutil
import commands
from struct import *
from xmlrpclib import ServerProxy, Error

loc = locale.getdefaultlocale()

def write2zenity(msg, msg_type='info'):
    'zenity message sink'
    os.system('zenity --%s --text="%s" --title "Napiprojekt" &' % (msg_type, msg))

def get_file(msg):
    'zenity "file-input" dialog'
    return commands.getoutput('zenity --file-selection --multiple --separator="|" --title "text2utf"')

def write2stdout(msg, msg_type='info'):
    'stdout message sink'
    print '%s: %s' % (msg_type, msg)

def subconvert(file):
    os.system('text2utf \'%s\'' % file)

def extract(src, dst):
    rozszerzenie = src[src.rfind('.')+1:]
    if (rozszerzenie == '7z'):
	if (os.system('/usr/bin/7z x -y -so -piBlm8NTigvru0Jr0 \'%s\' 2>/dev/null >\'%s\'' % (src, dst) )):
	    os.remove(dst)
            return False
	else:
	    return True
    if (rozszerzenie == 'gz'):
	if (os.system('cat \'%s\' | gunzip > \'%s\'' % (src, dst) )):
	    os.remove(dst)
            return False
        else:
            return True

def downfile(url, name):
    try:
	open(name,'w').write(urllib.urlopen(url).read())
    except IOError, e:
	printout(_('Downloading error'), 'error')
	print>>sys.stderr, e
	sys.exit(2)

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
        filenames = get_file(_('Indicate the movie, that you`re looking the subtitles for.')).split("|")
        if not filenames[0]:
            sys.exit(2)
     else:
        printout(_('Indicate the movie, that you`re looking the subtitles for.'), 'error')
        sys.exit(2)
if (len(filenames)>1):
    pr.store=1
for i in range(len(filenames)):
    mname = filenames.pop(0)
    if not os.path.isfile(mname):
	printout( _('File:')+" %s " % (mname)+_('not exist!'), 'error')
        continue

    filesize = os.path.getsize(mname)
    if filesize < 65536 * 2:                               
	printout(_('Chosed file is too small to be movie!')+" %sMB" % (filesize/(1024*1024) ) )
	continue

    fname = mname[:mname.rfind('.')+1]+'txt'
    
    sukces=0

    #
    #NAPIPROJECT
    #
    if (sukces != 1)and(loc[0]=="pl_PL"):
	def f(z):
	    'foobar hash function? ;-)'
	    idx = [ 0xe, 0x3,  0x6, 0x8, 0x2 ]
	    mul = [   2,   2,    5,   4,   3 ]
	    add = [   0, 0xd, 0x10, 0xb, 0x5 ]
	    b = []
	    for i in xrange(len(idx)):
    		a = add[i]
    		m = mul[i]
		i = idx[i]

    		t = a + int(z[i], 16)
    		v = int(z[t:t+2], 16)
    		b.append( ('%x' % (v*m))[-1] )
	
	    return ''.join(b)

	d = md5.new();
	d.update(open(mname).read(10485760))
	url = 'http://napiprojekt.pl/unit_napisy/dl.php?l=PL&f=%s&t=%s&v=other&kolejka=false&nick=&pass=&napios=%s'
	url = url % (d.hexdigest(), f(d.hexdigest()), os.name)
	downfile(url, 'napisy.7z')

	if (extract('napisy.7z', '%s.wyp' % fname)==True):
	    sukces=1
	    pobranoZ="Napiproject"
	os.remove('napisy.7z')
    #/NAPIPROJECT 



    #
    #OPENSUB
    #
    if (sukces != 1):
	def hashFile(name):
	    try:
		longlongformat = 'LL'  # signed long, unsigned long  
		bytesize = calcsize(longlongformat)
        	
		f = open(name, "rb")
        	 
        	hash = filesize
    		
        	for x in range(65536/bytesize):
            	        buffer = f.read(bytesize)
                	(l2, l1)= unpack(longlongformat, buffer)
            	        l_value = (long(l1) << 32) | long(l2)
            	        hash += l_value
		        hash = hash & 0xFFFFFFFFFFFFFFFF #to remain as 64bit number   
		
		
		f.seek(max(0,filesize-65536),0)
        	for x in range(65536/bytesize):
                	buffer = f.read(bytesize)
                	(l2, l1) = unpack(longlongformat, buffer)
                	l_value = (long(l1) << 32) | long(l2)
                	hash += l_value
                	hash = hash & 0xFFFFFFFFFFFFFFFF
                        
        	f.close()
        	returnedhash =  "%016x" % hash
        	return returnedhash
                
	    except(IOError):
		printout(_('Downloading error'), 'error')
		print>>sys.stderr, e
    		sys.exit(2)
	server = ServerProxy("http://www.opensubtitles.org/xml-rpc")
        myhash = hashFile(mname)                          
        size = os.path.getsize(mname)
        session =  server.LogIn("","","pl","python")
        token = session["token"]
	if (loc[0]=="pl_PL"):
	    opensubtitles_lang='pol'
	else:
	    opensubtitles_lang='eng'
        searchlist = [{'sublanguageid':opensubtitles_lang,'moviehash':myhash,'moviebytesize':str(size)}]
        moviesList = server.SearchSubtitles(token, searchlist)
        if moviesList['data']:
	    url = moviesList['data'][0]['SubDownloadLink']
	    downfile(url, 'napisy.gz')
	    if (extract('napisy.gz', '%s.wyp' % fname)==True):
    		sukces=1
    		pobranoZ="Opensubtitles"
	    os.remove('napisy.gz')
    #/OPENSUB

    if (sukces==1):
	printout(_('Downloaded subtitles for movie:')+' %s ' % (os.path.basename(fname))+_('from')+' %s.' % (pobranoZ) )
	subconvert('%s.wyp' % fname)
	shutil.move('%s.wyp' % fname, fname)
    else:
	printout(_('Did not find subscriptions for movie:')+' %s' % os.path.basename(mname), 'error')
pr.printstored()
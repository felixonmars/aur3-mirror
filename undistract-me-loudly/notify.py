#!/usr/bin/env python2
import pynotify, gtk, sys, os

def on_click(n, wid):
	n.close()
	gtk.main_quit()
	os.system("wmctrl -ia %s" % wid)

if __name__=="__main__":
	try:
		wid = sys.argv[1]
		text = " ".join(sys.argv[2:])
	except IndexError:
		print >> sys.stderr, "Usage: %s <window-id> [text]" % sys.argv[0]
		sys.exit(1)
	
	pynotify.init("Command completed")
	n = pynotify.Notification("Long command completed", text, "utilities-terminal")
	n.add_action(wid, "Go to terminal", on_click)
	n.set_urgency(pynotify.URGENCY_LOW)
	n.set_timeout(pynotify.EXPIRES_DEFAULT)
	n.connect('closed', gtk.main_quit)
	n.show()
	gtk.main()

import os.path

def findDirectories():
	DIRS_TO_CREATE = ['.', 'stock-schematics']
	# There is only one true platform
	dataDir = os.path.expanduser("~/.mcedit")
	for d in DIRS_TO_CREATE:
		p = os.path.join(dataDir, d)
		if not os.path.exists(p):
			print "Creating %s..." % p
			os.makedirs(p)
	# What does this?
	runningInEditor = False
	return (dataDir, runningInEditor)

dataDir, runningInEditor = findDirectories()

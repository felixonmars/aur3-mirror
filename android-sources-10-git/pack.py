# http://blog.michael-forster.de/2008/12/view-android-source-code-in-eclipse.html

from __future__ import with_statement  # for Python < 2.6

import os
import re
import zipfile

# open a zip file
DST_FILE = 'sources.zip'
if os.path.exists(DST_FILE):
  print DST_FILE, "already exists"
  exit(1)
zip = zipfile.ZipFile(DST_FILE, 'w', zipfile.ZIP_DEFLATED)

# some files are duplicated, copy them only once
written = {}

# iterate over all Java files
for dir, subdirs, files in os.walk('.'):
  for file in files:
    if file.endswith('.java'):
      # search package name
      path = os.path.join(dir, file)
      with open(path) as f:
        for line in f:
          match = re.match(r'\s*package\s+([a-zA-Z0-9\._]+);', line)
          if match:
            # copy source into the zip file using the package as path
            zippath = match.group(1).replace('.', '/') + '/' + file
            if zippath not in written:
              written[zippath] = 1
              zip.write(path, zippath)
            break;

zip.close()

from distutils.core import setup
setup(name='peapod',
      version='0.7.2',
      py_modules=['Peapod.peapod','Peapod.tagging','Peapod.OPML','Peapod.btclient','Peapod.feedparser','Peapod.download'],
      scripts=['peapod.py','btclient.py'],
      )
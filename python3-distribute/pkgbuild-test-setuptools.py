import sys 
try:
  import setuptools as s
except ImportError:
  sys.exit(0)
if hasattr(s, '_distribute'):
  # this is already the 'distribute' setuptools
  sys.exit(0)
sys.exit(1)  

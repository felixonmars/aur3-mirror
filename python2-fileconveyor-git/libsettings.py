import sys
import os

if not os.environ.get('DJANGO_SETTINGS_MODULE'):
    os.environ['DJANGO_SETTINGS_MODULE'] = 'django_settings'

if not os.environ.get('FILE_CONVEYOR_PATH'):
    os.environ['FILECONVEYOR_SETTINGS']='/etc/fileconveyor'
    sys.path.insert(0, '/etc/fileconveyor');
else:
    sys.path.insert(0, FILECONVEYOR_SETTINGS);

if not os.environ.get('FILE_CONVEYOR_PATH'):
    FILE_CONVEYOR_PATH = '/etc/fileconveyor'
else:
    FILE_CONVEYOR_PATH = os.environ.get('FILE_CONVEYOR_PATH')

from local_settings import *

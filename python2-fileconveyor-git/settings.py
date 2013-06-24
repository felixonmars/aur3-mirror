__author__ = "Wim Leers (work@wimleers.com)"
__version__ = "$Rev$"
__date__ = "$Date$"
__license__ = "GPL"


import logging

TRANSPORTER_CLASS = 'TransporterCumulus'
RESTART_AFTER_UNHANDLED_EXCEPTION = True
RESTART_INTERVAL = 10
LOG_FILE = '/var/log/fileconveyor.log'
PID_FILE = '/var/run/fileconveyor/fileconveyor.pid'
PERSISTENT_DATA_DB = '/var/lib/fileconveyor/persistent_data.db'
SYNCED_FILES_DB = '/var/lib/fileconveyor/synced_files.db'
WORKING_DIR = '/tmp/fileconveyor'
MAX_FILES_IN_PIPELINE = 50
MAX_SIMULTANEOUS_PROCESSORCHAINS = 1
MAX_SIMULTANEOUS_TRANSPORTERS = 10
MAX_TRANSPORTER_QUEUE_SIZE = 1
QUEUE_PROCESS_BATCH_SIZE = 20
CALLBACKS_CONSOLE_OUTPUT = False
CONSOLE_LOGGER_LEVEL = logging.DEBUG
FILE_LOGGER_LEVEL = logging.DEBUG
RETRY_INTERVAL = 30
FILE_CONVEYOR_PATH= '/etc/fileconveyor'
DJANGO_SETTINGS_MODULE = 'django_settings'

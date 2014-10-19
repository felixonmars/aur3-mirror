#!/bin/bash

# Error:
#   Traceback (most recent call last):
#     File "/usr/bin/PyODConverter.py", line 16, in <module>
#       from com.sun.star.task import ErrorCodeIOException
#     File "/usr/lib/openoffice/basis-link/program/uno.py", line 295, in _uno_import
#       raise ImportError( "type "+ name + "." +x + " is unknown" )
#   ImportError: type com.sun.star.task.ErrorCodeIOException is unknown

# https://bugzilla.novell.com/show_bug.cgi?id=440090
#   Problem solved by adding
#     export URE_BOOTSTRAP="vnd.sun.star.pathname:$ooo_home/program/fundamentalrc" before running

# http://www.oooforum.org/forum/viewtopic.phtml?t=77827
#   Comment out:
#     from com.sun.star.task import ErrorCodeIOException
#   Replace:
#     except ErrorCodeIOException, exception:
#         print "ERROR! ErrorCodeIOException %d" % exception.ErrCode
#   With:
#     except Exception, exception:
#         print "ERROR! %s" % exception

export URE_BOOTSTRAP="vnd.sun.star.pathname:/usr/lib/openoffice/program/fundamentalrc"
exec python2 /usr/bin/PyODConverter.py "${@}"

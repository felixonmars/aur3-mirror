'''
Modify this file, by platform, to handle nonstandard options for third-party
dependencies. If you do modify this file, you should make it read-only
(or otherwise protect it) so that CVS will not overwrite it.

Order is important: place local paths ahead of system paths.
'''
import sys

customCPPPATH = []
customCCFLAGS = []
customCXXFLAGS = []
customLIBS = []
customLIBPATH = []
customSHLINKFLAGS = []
customSWIGFLAGS = []

if sys.platform[:5] == 'linux':
    platform = 'linux'
    customCPPPATH.append('/usr/lib/jvm/java-6-openjdk/include')
    customCPPPATH.append('/usr/lib/jvm/java-7-openjdk/include')
    customCPPPATH.append('/usr/lib/jvm/java-7-openjdk/include/linux')
    customCPPPATH.append('/usr/lib/jvm/java-6-openjdk/include/linux')
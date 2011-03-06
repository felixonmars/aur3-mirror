# -*- coding: utf-8  -*-

# This is a sample config file. Please create a directory '.pywikibot'
# in your home directory and copy this file as 'user-config.py'.
# Then don't forget to edit it to suit your needs ;)

# See /usr/lib/python2.7/site-packages/pywikibot/config2.py for all
# the available options (you just have to define them here, they'll
# take precedence over the default ones)


# The family of sites we are working on.
# See /usr/lib/python2.7/site-packages/pywikibot/families for a list
# of known families. In case you want to add some, just create the
# '/home/<user>/.pywikibot/families' directory and put your files here
# according to the syntax '<family_name>_family.py'.
family = 'wikipedia'

# The language code of the site we're working on.
mylang = 'en'

# The dictionary usernames should contain a username for each site where you
# have a bot account.
usernames['wikipedia']['en'] = 'myEnglishUsername'
usernames['wiktionary']['fr'] = 'myFrenchUsername'


# The encoding in which textfiles are stored, which contain lists of page
# titles. The most used is: 'utf-8'. 'utf-8-sig' recognizes BOM but it is
# available on Python 2.5 or higher. For a complete list please see:
# http://docs.python.org/library/codecs.html#standard-encodings
textfile_encoding = 'utf-8'


# These are additional settings you may want to have a look, relative
# to specific scripts and further configuration.
# See /usr/lib/python2.7/site-packages/pywikibot/config2.py for
# details.

############## LOGFILE SETTINGS ##############

############## INTERWIKI SETTINGS ##############

############## SOLVE_DISAMBIGUATION SETTINGS ############

############## IMAGE RELATED SETTINGS ##############

############## SETTINGS TO AVOID SERVER OVERLOAD ##############

############## TABLE CONVERSION BOT SETTINGS ##############

############## WEBLINK CHECKER SETTINGS ##############

############## DATABASE SETTINGS ##############

############## SEARCH ENGINE SETTINGS ##############

############## COPYRIGHT SETTINGS ##############

############## HTTP SETTINGS ##############

############## FURTHER SETTINGS ##############

#!/bin/sh

#unsetting this variable seems to be needed to keep from using incompatible Arch QT libs
unset QT_PLUGIN_PATH

LD_LIBRARY_PATH=/opt/scrivener/lib /opt/scrivener/Scrivener
EOF

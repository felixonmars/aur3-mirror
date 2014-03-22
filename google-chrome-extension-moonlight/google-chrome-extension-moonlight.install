#!/bin/sh
# vim:set ts=2 sw=2 et:

# arg 1:  the new package version
pre_install() {
  /bin/true
# rm /opt/google/chrome/default_apps/external_extensions.json
}

# arg 1:  the new package version
post_install() {
  if [ -d "/opt/google/chrome-unstable" ]
    then
    cd /opt/google/chrome-unstable/default_apps
  elif [ -d  "/opt/google/chrome-beta" ]
    then
    cd /opt/google/chrome-beta/default_apps
  else
    cd /opt/google/chrome/default_apps
  fi

  cp external_extensions.json external_extensions.json.bak
  patch -p1 < external_extensions.patch
}

# arg 1:  the new package version
# arg 2:  the old package version
pre_upgrade() {
  /bin/true
# rm /opt/google/chrome/default_apps/external_extensions.json
}

# arg 1:  the new package version
# arg 2:  the old package version
post_upgrade() {
  if [ -d "/opt/google/chrome-unstable" ]
    then
    cd /opt/google/chrome-unstable/default_apps
  elif [ -d  "/opt/google/chrome-beta" ]
    then
    cd /opt/google/chrome-beta/default_apps
  else  
    cd /opt/google/chrome/default_apps
  fi

  cp external_extensions.json.bak external_extensions.json
  patch -p1 < external_extensions.patch
}

# arg 1:  the new package version
pre_remove() {
  /bin/true
}

# arg 1:  the new package version
post_remove() {
    if [ -d "/opt/google/chrome-unstable" ]
    then
    cd /opt/google/chrome-unstable/default_apps
  elif [ -d  "/opt/google/chrome-beta" ]
    then
    cd /opt/google/chrome-beta/default_apps
  else
    cd /opt/google/chrome/default_apps
  fi

  mv external_extensions.json.bak external_extensions.json
}

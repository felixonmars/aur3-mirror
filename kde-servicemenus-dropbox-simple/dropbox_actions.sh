#!/bin/bash

copy_to_public_and_get_url() {
  DROPBOX=$(/usr/lib/dropbox/get_dropbox_folder.sh 2>/dev/null)
  if [ "$DROPBOX" == "" ]; then
    kdialog --error "Dropbox folder was not found!"
    return 1
  fi
  
  if [ ! -e $DROPBOX/Public ] || [ ! -d $DROPBOX/Public ]; then
    kdialog --yesno "Public folder does't exist in '$DROPBOX'. Create?"
    if [ ! $? -eq 0 ]; then
      return 1
    fi
    ERROR_CREATE=$(mkdir $DROPBOX/Public 2>&1 >/dev/null)
    if [ ! $? -eq 0 ]; then
      kdialog --error "Can't create directory '$DROPBOX/Public': \n$ERROR_CREATE!"
      return 1
    fi
  fi
  ERROR_COPY=$(cp -R $1 $DROPBOX/Public 2>&1 >/dev/null)
  if [ ! $? -eq 0 ]; then
    kdialog --error "Can't copy '$(basename $1)' to '$DROPBOX/Public': \n$ERROR_COPY!"
    return 1
  fi
  copy_public_url $DROPBOX/Public/$(basename $1)
}

move_to_public_and_get_url() {
  DROPBOX=$(/usr/lib/dropbox/get_dropbox_folder.sh 2>/dev/null)
  if [ "$DROPBOX" == "" ]; then
    kdialog --error "Dropbox folder was not found!"
    return 1
  fi
  if [ ! -e $DROPBOX/Public ] || [ ! -d $DROPBOX/Public ]; then
    kdialog --yesno "Public folder does't exist in '$DROPBOX'. Create?"
    if [ ! $? -eq 0 ]; then
      return 1
    fi
    ERROR_CREATE=$(mkdir $DROPBOX/Public 2>&1 >/dev/null)
    if [ ! $? -eq 0 ]; then
      kdialog --error "Can't create directory '$DROPBOX/Public': \n$ERROR_CREATE!"
      return 1
    fi
  fi
  ERROR_COPY=$(mv $1 $DROPBOX/Public 2>&1 >/dev/null)
  if [ ! $? -eq 0 ]; then
      kdialog --error "Can't move '$(basename $1)' to '$DROPBOX/Public': \n$ERROR_COPY!"
      return 1
  fi
  copy_public_url $DROPBOX/Public/$(basename $1)
}

copy_public_url() {
  PTH=$(realpath "$1")
  RDY=$(dropbox-cli puburl "$PTH")
  if [ ! $? -eq 0 ]; then
    kdialog --error $RDY
    return 1
  else
    echo $RDY | xclip -i -selection cli 
  fi
  
}

mail_public_url() {
  xdg-email --subject "Download URL for $(basename $1)" --body "$(dropbox-cli puburl $(realpath $1))" 
}

case "$1" in
    copy_public_url) copy_public_url "$2" ;;
    mail_public_url) mail_public_url "$2" ;;
    copy_to_public_and_get_url) copy_to_public_and_get_url "$2" ;;
    move_to_public_and_get_url) move_to_public_and_get_url "$2" ;;
    2) echo 3 ;;
esac

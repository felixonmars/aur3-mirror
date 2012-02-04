#!/bin/bash
post_install()
{
  update-mime-database /usr/share/mime
}

pre_upgrade()
{
  rm -rf /opt/enigma/ENIGMAsystem/SHELL/Preprocessor_Environment_Editable /opt/enigma/definitions.h
  find /opt/enigma -type f -name "*.a" -exec rm {} \;
  find /opt/enigma -depth -type d -exec rmdir {} --ignore-fail-on-non-empty \;
}

post_upgrade()
{
  update-mime-database /usr/share/mime
}

post_remove()
{
  rm -rf /opt/enigma/ENIGMAsystem/SHELL/Preprocessor_Environment_Editable /opt/enigma/definitions.h
  find /opt/enigma -type f -name "*.a" -exec rm {} \;
  find /opt/enigma -depth -type d -exec rmdir {} --ignore-fail-on-non-empty \;
}

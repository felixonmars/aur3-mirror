#!/bin/sh

post_install() {
cat << EOF

PRC-Tools requires a Palm OS SDK installation. You can grab Palm OS SDK version
5.1 at (requires free sign-up):

    http://www.accessdevnet.com/index.php/Garnet-OS-SDK-68K-R3-PRC-tools-Generic-UNIX/View-category.html

The SDK files need to be placed in /opt/palmdev/sdk-5 so that PRC-Tools can find
the following:
    /opt/palmdev/sdk-5/include
    /opt/palmdev/sdk-5/lib
Alternatively, you can install the palm-os-sdk package from AUR.

After the SDK has been installed, you need to run the following at the command
line as the root user:
    # palmdev-prep
This makes PRC-Tools look for the SDK files and cache their location.
EOF
}

post_upgrade() {
  post_install
}

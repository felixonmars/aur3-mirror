chown -R $USER /opt/android-sdk
groupadd android
gpasswd -a $USER android
chgrp -R android /opt/android-sdk
chmod -R g+w /opt/android-sdk
find /opt/android-sdk -type d -exec chmod g+s {} \;
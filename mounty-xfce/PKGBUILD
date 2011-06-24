# Maintainer: Dan Serban

pkgname=mounty-xfce
pkgver=0.1.3
pkgrel=1
pkgdesc="FuseISO frontend for the systray, patched for XFCE (libappindicator dependency removed)"
arch=(any)
url=https://launchpad.net/mounty
license=(GPLv3)
depends=(fuseiso python2 python2-gconf pygobject pygtk python-notify thunar)
optdepends=(xfce4-notifyd)
source=(diskimage.py mounty.py)
md5sums=('72e0fd2f6af890e9950c6537c9d260bd'
         'bff20bf0d8a1803bb0026219e3dfe8ba')

build()
{
  install -Dm644 diskimage.py "${pkgdir}"/usr/share/mounty/diskimage.py
  install -Dm644 mounty.py "${pkgdir}"/usr/share/mounty/mounty.py
  mkdir -p "$pkgdir/usr/bin"
  USRBINFILE="${pkgdir}"/usr/bin/${pkgname}
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/mounty' >> "${USRBINFILE}"
  echo 'python2 mounty.py' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/etc/xdg/autostart
  DESKTOPFILE="${pkgdir}"/etc/xdg/autostart/${pkgname}.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Mounty (CD Image Mounter)" >> "${DESKTOPFILE}"
  echo "Comment=Mount CD images" >> "${DESKTOPFILE}"
  echo "Icon=media-cdrom" >> "${DESKTOPFILE}"
  echo "Exec=mounty-xfce" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=GTK;Utility;Core;" >> "${DESKTOPFILE}"
  echo "NotShowIn=KDE;" >> "${DESKTOPFILE}"
}


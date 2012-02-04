# Maintainer: Dan Serban

pkgname=traywbar
pkgver=0.1
pkgrel=1
pkgdesc="A systray icon that pops up a menu with the same selection of applications you already have configured for wbar"
arch=(any)
url=http://127.0.0.1/
license=(GPLv3)
depends=(python2 pygtk wbar)
source=(traywbar-0.1.py)
md5sums=('f1ba6144a52d5a2bbc4f62bdcf483382')

build()
{
  install -Dm755 traywbar-0.1.py "${pkgdir}"/usr/bin/traywbar
  mkdir -p "${pkgdir}"/etc/xdg/autostart
  DESKTOPFILE="${pkgdir}"/etc/xdg/autostart/${pkgname}.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=TrayWbar" >> "${DESKTOPFILE}"
  echo "Comment=TrayWbar menu for the systray" >> "${DESKTOPFILE}"
  echo "Icon=stock_home" >> "${DESKTOPFILE}"
  echo "Exec=traywbar" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=GTK;Utility;Core;" >> "${DESKTOPFILE}"
  echo "NotShowIn=KDE;" >> "${DESKTOPFILE}"
}


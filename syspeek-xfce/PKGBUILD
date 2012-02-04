# Maintainer: Dan Serban

pkgname=syspeek-xfce
pkgver=0.2
pkgrel=1
pkgdesc="A system monitor indicator for the systray, patched for XFCE (libappindicator dependency removed)"
arch=(any)
url=https://launchpad.net/syspeek
license=(GPL)
depends=(python2 pygobject pygtk)
source=(syspeek.py __init__.py helper.py indicator.py supplier.py)
md5sums=('edd496bd9bb10aeccda3d4f924c189ab'
         '0536227bb6925d90a38dbcb36a0f79ba'
         '30049f9dc6500b8effa3398ba6a1a868'
         'fae2e91b57d990cef0eac21557d54a41'
         '0faab4ee3c3ea275695acd45ec576ff6')

build()
{
  install -Dm644 syspeek.py "${pkgdir}"/usr/share/syspeek/syspeek.py
  install -Dm644 __init__.py "${pkgdir}"/usr/share/syspeek/syspeek/__init__.py
  install -Dm644 helper.py "${pkgdir}"/usr/share/syspeek/syspeek/helper.py
  install -Dm644 indicator.py "${pkgdir}"/usr/share/syspeek/syspeek/indicator.py
  install -Dm644 supplier.py "${pkgdir}"/usr/share/syspeek/syspeek/supplier.py
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/${pkgname}
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/syspeek' >> "${USRBINFILE}"
  echo 'python2 syspeek.py' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/${pkgname}.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=SysPeek" >> "${DESKTOPFILE}"
  echo "Comment=SysPeek System Monitor Indicator" >> "${DESKTOPFILE}"
  echo "Icon=utilities-system-monitor" >> "${DESKTOPFILE}"
  echo "Exec=syspeek-xfce" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=GTK;Utility;Core;" >> "${DESKTOPFILE}"
  echo "NotShowIn=KDE;" >> "${DESKTOPFILE}"
}


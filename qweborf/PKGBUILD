pkgname=qweborf
pkgver=0.13
pkgrel=1
pkgdesc="QT-based GUI for weborf"
arch=(any)
url=http://galileo.dmi.unict.it/wiki/weborf/
license=(GPLv3)
depends=(python2-pyqt weborf)
source=(main.py nhelper.py qweborf.py whelper.py)
md5sums=('83d25f222ab6e7c67d2b468e552b8bfe'
         '83f2a59c096a34977f99480b6ccfcd2f'
         'bef19d4c30cda4206349553130749750'
         '29ddb6da4e2cf53ddb1824cd76493621')

build()
{
  mkdir -p "${pkgdir}"/usr/share/qweborf
  cp "${startdir}"/main.py "${startdir}"/nhelper.py "${startdir}"/qweborf.py "${startdir}"/whelper.py "${pkgdir}"/usr/share/qweborf/
  QWEBORFFILE="${pkgdir}"/usr/share/qweborf/qweborf
  echo 'import qweborf' > "${QWEBORFFILE}"
  echo 'qweborf.q_main()' >> "${QWEBORFFILE}"
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/qweborf
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/qweborf' >> "${USRBINFILE}"
  echo 'exec python2 qweborf' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/qweborf.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=qweborf" >> "${DESKTOPFILE}"
  echo "GenericName=qweborf" >> "${DESKTOPFILE}"
  echo "Comment=Shares files using the HTTP protocol" >> "${DESKTOPFILE}"
  echo "Exec=qweborf" >> "${DESKTOPFILE}"
  echo "Icon=network-wired" >> "${DESKTOPFILE}"
  echo "Terminal=0" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=Network;" >> "${DESKTOPFILE}"
}


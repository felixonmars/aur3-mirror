# Maintainer: mmm
# Contributor: Dan Serban

pkgname=syncany-bzr
pkgver=latest
pkgrel=1
pkgdesc="An open-source cloud storage and filesharing application (a Dropbox work-alike with more flexibility in terms of storage type and provider)"
arch=(any)
url=http://www.syncany.org/
license=(GPL)
depends=(java-runtime python2 python2-notify)
makedepends=(bzr apache-ant java-environment)

build()
{
  bzr branch lp:~syncany-team/syncany/trunk
  cd trunk/syncany
  ant
  mv dist syncany
  mkdir -p "${pkgdir}"/usr/share
  mv syncany "${pkgdir}"/usr/share/
  sed -i 's/Xms512m/Xmx256m/' "${pkgdir}"/usr/share/syncany/bin/syncany.sh
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/syncany
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo '/usr/share/syncany/bin/syncany.sh' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/syncany.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Syncany" >> "${DESKTOPFILE}"
  echo "Comment=Cloud storage and filesharing application" >> "${DESKTOPFILE}"
  echo "Exec=/usr/share/syncany/bin/syncany.sh" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Categories=Network;" >> "${DESKTOPFILE}"
}


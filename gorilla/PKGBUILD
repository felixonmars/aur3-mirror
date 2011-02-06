# Contributor: BenObiWan <benobiwan @t gmail dot com>
pkgname=gorilla
pkgver=1.4
pkgrel=1
pkgdesc="A login/password manager. Password are stored in a encrypted file protected by a 'master password'."
arch=('i686' 'x86_64')
url="http://www.fpx.de/fp/Software/Gorilla/"
license=('GPL')
depends=('tclkit>=8.4')
options=(!strip)
source=(http://www.fpx.de/fp/Software/Gorilla/download/${pkgname}-${pkgver}.kit)
md5sums=('fb13222b24c9d18439f8b81921864e8a')

build() {
  mkdir -p ${pkgdir}/usr/bin  || return 1
  mkdir -p ${pkgdir}/usr/share/gorilla || return 1
  install -o root -g root -m 644 ${srcdir}/${pkgname}-${pkgver}.kit ${pkgdir}/usr/share/gorilla/ 

  echo '#!/bin/bash' > ${pkgdir}/usr/bin/gorilla
  echo "/usr/bin/tclkit /usr/share/gorilla/${pkgname}-${pkgver}.kit" >> ${pkgdir}/usr/bin/gorilla
  chown root:root ${pkgdir}/usr/bin/gorilla
  chmod 755 ${pkgdir}/usr/bin/gorilla
}


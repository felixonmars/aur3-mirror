# Maintainer: Jason Melton <jason.melton@gmail.com>

pkgname=ckhet
pkgver=0.1.6
pkgrel=1
pkgdesc="Simple curses implementation of the board came Khet"
arch=(i686 x86_64)
depends=('ncurses')
source=(http://mbays.freeshell.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)

license=(GPL)
url="http://mbays.freeshell.org/ckhet"

build() {
  cd ${srcdir}/${pkgname}
    # Patch for python2
        sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
               -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
               $(find ${srcdir} -type f)
}

package() {
  cd ${srcdir}/${pkgname}

  mkdir -p ${pkgdir}/usr/share/${pkgname}
  cp -R * ${pkgdir}/usr/share/${pkgname}
  chmod +x ${pkgdir}/usr/share/${pkgname}/${pkgname}.py

  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/${pkgname}/${pkgname}.py ${pkgdir}/usr/bin/${pkgname}

}

md5sums=('678a931a0d1e8f8b915ef5997d2b15aa')

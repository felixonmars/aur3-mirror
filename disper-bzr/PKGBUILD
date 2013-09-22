# Maintainer: Clément Démoulins <clement@archivel.fr>
# Contributor: Thomas Jost <schnouki@schnouki.net>

pkgname=disper-bzr
_realname=disper
pkgver=120
pkgrel=2
pkgdesc="An on-the-fly display switch utility, intended to be used on laptops, especially with nVidia cards."
arch=('any')
url="http://willem.engen.nl/projects/disper/"
license=('GPL')
depends=('python2')
makedepends=('bzr' 'help2man')
provides=('disper')
conflicts=('disper')

source=('disper::bzr+http://bazaar.launchpad.net/~disper-dev/disper/trunk/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  bzr revno
}

build() {
  cd "$srcdir/${_realname}"
  # Patch to use python2
  find . -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/${_realname}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install

  # Patch to use python2
  find "$pkgdir" -type f \( -name '*.py' -or -executable \) -exec \
    sed -i -e 's|#![ ]*/usr/bin/python$|#!/usr/bin/python2|' \
           -e 's|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|' \
    {} \;

}

# vim:set ts=2 sw=2 et:

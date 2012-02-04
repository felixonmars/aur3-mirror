# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=gnome15-gnome-plugins
pkgver=0.0.6
pkgrel=1
pkgdesc="Gnome related plugins for gnome15"
arch=(any)
url="http://www.gnome15.org/"
license=('GPL')
depends=(python2 gnome15 python-evolution python-vobject python-gnomekeyring)
optdepends=('pyxdg: for "Indicator Me" plugin'
            'indicator-me: for "Indicator Me" plugin'
            'indicator-messages: for "Indicator Messages" plugin')
source=(http://www.gnome15.org/downloads/Gnome15/Optional/${pkgname}-${pkgver}.tar.gz)
md5sums=('e0aac7b1137daf7e54871667cbd1f05e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # python2 fix
  for file in $(find . -type f -name '*' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  ./configure --prefix=/usr PYTHON=python2 PYTHON_VERSION=2
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:

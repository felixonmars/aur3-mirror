# Maintainer: Tetsumaki <http://goo.gl/YMBdA>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Stefano Esposito <ragnarok@email.it>

pkgname=gtkpacman
pkgver=2.3.1
pkgrel=4
pkgdesc="GTK package manager for archlinux based on pacman"
arch=('any')
url="http://gtkpacman.berlios.de/"
license=('GPL')
depends=('pygtk' 'vte')
source=("http://download.berlios.de/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0ee571a5b1efcf5d8594a6eb04456a598c6354301ee6300c6508999c1eb87b88')

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # python2 fix
  for _file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "${_file}"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "${_file}"
  done
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

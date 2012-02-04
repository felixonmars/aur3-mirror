# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dsgui
pkgver=1.6.3
pkgrel=1
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('any')
url="http://labs.nic.cz/page/740/dsgui/"
license=('GPL2')
depends=('dslib' 'pygtk' 'python2-sqlalchemy' 'hicolor-icon-theme')
makedepends=('python2-distribute')
install=$pkgname.install
source=(http://labs.nic.cz/files/labs/datove_schranky/$pkgname-$pkgver.tar.gz)
sha256sums=('07929b02e162a965d6a1756066e39fc2bec8fcabb3ffb8498deef1302ab1f517')

build() {
  cd ${srcdir}/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root=${pkgdir}
}

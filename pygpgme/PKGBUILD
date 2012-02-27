# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Caner Candan <caner@candan.fr>
pkgname=pygpgme
pkgver=0.2
pkgrel=1
pkgdesc="A Python module for working with OpenPGP messages"
url="https://launchpad.net/pygpgme"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gpgme' 'python2')
makedepends=('make')
conflicts=()
replaces=()
backup=()
install=
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz
	python2.patch
	add_missing_check_version.patch)
md5sums=('674e3f5374efa2aaac7ab420810c91e6'
         '7797b636295374e04ea0b6656bf49f35'
         '50b8c4ac4235b5433142d638563e0131')

build() {
  cd $startdir/src/$pkgname-$pkgver/src
  patch -p0 -f < $startdir/src/add_missing_check_version.patch
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -f < $startdir/src/python2.patch
  make || return 1
  ./setup.py install --root=$startdir/pkg --optimize=1
}

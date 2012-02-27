# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Caner Candan <caner@candan.fr>
pkgname=pyme
pkgver=0.8.1
pkgrel=1
pkgdesc="Python interface to the GPGME GnuPG encryption library"
url="http://pyme.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL')
depends=('gpgme' 'python2' 'swig')
makedepends=('make')
conflicts=()
replaces=()
backup=()
install=
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz/download
	python2.patch
	add_missing_check_version.patch)
md5sums=('97d744f7a4a95700e9edeee84384e8aa'
         '49cad7f9416e583f4f8147bc1249e29f'
         '2005383f528cc6e1497ced6e32f37101')

build() {
  cd $startdir/src/$pkgname-$pkgver/$pkgname
  patch -p0 -f < $startdir/src/add_missing_check_version.patch
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 -f < $startdir/src/python2.patch
  make || return 1
  ./setup.py install --root=$startdir/pkg --optimize=1
}

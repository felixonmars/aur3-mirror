# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Caner Candan <caner@candan.fr>
_pkgname=pyme
pkgname=python-pyme
pkgver=0.8.1
pkgrel=1
pkgdesc="Python interface to the GPGME GnuPG encryption library"
url="http://pyme.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL')
depends=('gpgme' 'python' 'swig')
makedepends=('make')
conflicts=()
replaces=()
backup=()
install=
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz/download
	add_missing_check_version.patch
	convert_2to3.patch)
md5sums=('97d744f7a4a95700e9edeee84384e8aa'
         '2005383f528cc6e1497ced6e32f37101'
         'bc5cfe10161f2f3f132fd64ac4f5a1df')

build() {
  cd $startdir/src/$_pkgname-$pkgver/$_pkgname
  patch -p0 -f < $startdir/src/add_missing_check_version.patch
  cd $startdir/src/$_pkgname-$pkgver
  patch -p0 -f < $startdir/src/convert_2to3.patch
  make || return 1
  ./setup.py install --root=$startdir/pkg --optimize=1
}

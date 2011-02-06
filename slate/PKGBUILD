# $Id: $Id$
# Maintainer: Michael 'manveru' Fellinger <m.fellinger@gmail.com>
pkgname=slate
pkgver=0.3.5
pkgrel=1
pkgdesc="Slate is a prototype-based object-oriented programming language based on Self, CLOS, and Smalltalk-80."
url="http://slate.tunes.org"
depends=('glibc')
source=(http://slate.tunes.org/downloads/${pkgname}-${pkgver}.tgz)
md5sums=('718630cd139b20081d4b6cfe0f4973d8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i -e "s|prefix=/usr|prefix=$startdir/pkg/usr|g" Makefile.inc || return 1
  #make prefix=${startdir}/pkg/usr/ || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

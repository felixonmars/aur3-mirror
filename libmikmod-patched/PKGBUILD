# $Id: PKGBUILD,v 1.4 2009/01/18 20:41:08 danimoth Exp $
# Maintainer: p.kosyh <p.kosyh@gmail.com>
pkgname=libmikmod-patched
pkgver=3.1.12
pkgrel=1
pkgdesc="A portable sound library"
license=('GPL' 'LGPL')
url="http://sourceforge.net/projects/mikmod/"
arch=('i686' 'x86_64' 'ppc')
depends=('glibc')
conflicts=('libmikmod')
provides=('libmikmod=3.1.12')
source=(http://instead.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('592f14edcc98d0ea5889567b6365fa1b')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  missing_dir="`pwd`" ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

# $Id: PKGBUILD,v 1.1 2007/11/04 02:54:08 Snowman Exp $
# Contributor: Sarah Hay <sarah31@sarah31.ca>

pkgname=mowitz
pkgver=0.3.1
pkgrel=1
pkgdesc="This is the Mowitz (More widgets) library"
arch=(i686 x86_64)
depends=('glibc')
makedepends=('nextaw')
license=('GPL' 'LGPL' 'MIT')
options=('!libtool')
source=(http://siag.nu/pub/mowitz/Mowitz-$pkgver.tar.gz LICENSE)
md5sums=('35cfd18b05d45e0ba6b48896bd258138' '06cfd84e3a2259c56f6d05824612c726')
url="http://siag.nu/mowitz/"

build() {
  cd $startdir/src/Mowitz-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}

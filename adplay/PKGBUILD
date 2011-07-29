# Maintainer: p2k <Patrick.Schneider@uni-ulm.de>
pkgname=adplay
pkgver=1.7
pkgrel=1
pkgdesc="Console frontend for AdPlug, the free, cross-platform, hardware independent AdLib sound player library."
arch=('i686' 'x86_64')
url="http://adplug.sourceforge.net/"
license=('LGPL')
depends=('adplug>=2.2')
source=(http://downloads.sourceforge.net/project/adplug/AdPlay_UNIX/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('651b301b21f08a7519ce8ed3742a0081')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# Previous Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
# Maintainer: Ronny Steiner <post@sirsteiner.de>

pkgname=spandsp
pkgver=0.0.6pre20
pkgrel=1
pkgdesc="Library providing many of the DSP functions needed for telephony"
url="http://www.soft-switch.org/"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('libtiff')
makedepends=('libtiff')
source=("http://www.soft-switch.org/downloads/$pkgname/$pkgname-$pkgver.tgz")
md5sums=('9bdf1d027f1b5dc5e622d707fa1634cb')

build() {
  cd $srcdir/$pkgname-$(echo $pkgver | sed -e 's/pre[0-9]*//g')
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

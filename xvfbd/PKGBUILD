# Maintainer: Nickolay Orekhov <nowhere@mail.ru>

pkgname=xvfbd
pkgver=1
pkgrel=1
pkgdesc="Fake X server daemon"
arch=( any )
url='http://xorg.freedesktop.org'
license=( custom )
depends=( 'xorg-server-xvfb' )
source=( xvfbd )
md5sums=( 'aed590a300287645b7454803f13fb006' )

build() {
  mkdir -p $pkgdir/etc/rc.d
  cp $srcdir/xvfbd $pkgdir/etc/rc.d
}

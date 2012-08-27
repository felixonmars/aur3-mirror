# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>
# Originally by: Denis Smirnov <detanator@gmail.com>
pkgname=intel-gpu-tools
pkgver=1.3
pkgrel=1
pkgdesc="Tools for development and testing of the Intel DRM driver"
arch=(i686 x86_64)
license=('custom')
url="http://lists.freedesktop.org/archives/xorg/2009-April/045350.html"
depends=('libdrm' 'libpciaccess' 'cairo')
source=(http://xorg.freedesktop.org/releases/individual/app/$pkgname-$pkgver.tar.bz2)
md5sums=('67facd6241e26e2c68614728e3a932e9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make
  make DESTDIR=$pkgdir install
}

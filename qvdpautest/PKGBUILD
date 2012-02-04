# Contributor: Luca Bennati <lucak3@gmail.com>
pkgname=qvdpautest
pkgver=0.5.1
pkgrel=1
pkgdesc="VDPAU decoding performance tester"
arch=('i686' 'x86_64')
url="http://www.nvnews.net/vbulletin/showthread.php?t=133465"
license=('unknown')
depends=('qt' 'libvdpau')
makedepends=()
source=(http://hftom.free.fr/$pkgname-$pkgver.tar.gz
		ugly.patch)
md5sums=('4835a39d4a363cf4e2d971f2f6912a29'
         '15ca6e5da5011653e7094db77bc34520')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 -i ../ugly.patch

  qmake
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d ${pkgdir}/usr/bin/
  install qvdpautest ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/qvdpautest/
  install *.dat ${pkgdir}/usr/share/qvdpautest/
}

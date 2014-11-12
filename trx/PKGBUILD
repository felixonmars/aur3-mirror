# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=trx
pkgver=0.2
pkgrel=1
pkgdesc="A simple toolset for broadcasting live audio from Linux"
arch=(i686 x86_64)
url="http://www.pogo.org.uk/~mark/trx/"
license=('GPL')
depends=('alsa-lib' 'opus' 'ortp')
source=("${url}releases/$pkgname-$pkgver.tar.gz")
md5sums=('ebc0fbf498a18c389dbb3becc7d844ff')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

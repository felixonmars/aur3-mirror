# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=hdsync
pkgver=1.2
pkgrel=1
pkgdesc="Achieve synchronous playback of multiple HD videos on multiple screens."
arch=(i686 x86_64)
url="http://syncstarter.org/hdsync/"
license=('AGPL' 'GPL3')
source=("http://ftp.dyne.org/$pkgname/releases/$pkgname-$pkgver.tar.gz")
md5sums=('aac03716a4dd66376a0205484e92c0c6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

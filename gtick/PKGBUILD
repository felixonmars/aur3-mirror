# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: damir <damir@archlinux.org>

pkgname=gtick
pkgver=0.5.4
pkgrel=1
pkgdesc="A Gtk metronome application supporting different meters and speeds."
arch=('i686' 'x86_64')
url="http://www.antcom.de/gtick/"
license=('GPL3')
depends=('gtk2' 'libpulse')
makedepends=('libsndfile')
optdepends=('pulseaudio: pulseaudio sound system support')
install="$pkgname.install"
source=("http://www.antcom.de/gtick/download/$pkgname-$pkgver.tar.gz")
md5sums=('1df601c1ff202a9a888f982087fa2488')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jackbeat
pkgver=0.7.6
pkgrel=1
pkgdesc="A Gtk2 audio sequencer"
arch=('i686' 'x86_64')
url="http://jackbeat.samalyse.org/"
license=('GPL')
depends=('gtk2' 'libpulse' 'portaudio' 'liblo')
source=("http://jackbeat.samalyse.org/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('472236c1a4784e62f395e69dcba404b4')

prepare() {
  # DSO link fix
  export LIBS=" -lgmodule-2.0"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

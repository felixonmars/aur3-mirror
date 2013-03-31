# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Patrick Leslie Polzer <leslie.polzer@gmx.net>

pkgname=meterbridge
pkgver=0.9.2
pkgrel=5
pkgdesc="Various sound meters for JACK"
arch=('i686' 'x86_64')
url="http://plugin.org.uk/meterbridge/"
license=('GPL')
depends=('jack' 'sdl_image')
source=("http://plugin.org.uk/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ef5d20761755c88e5b5a0c35f11f670e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # gcc fix
  sed -i "s/ buf_rect.*,//" src/main.h

  # autoconf fix
  sed -i "s/AM\(_CONFIG_HEADER\)/AC\1S/" configure.in

  autoreconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

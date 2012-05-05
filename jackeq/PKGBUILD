# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Philipp Überbacher <murks at lavabit dot com >

_name=jackEQ
pkgname=jackeq
pkgver=0.5.9
pkgrel=2
pkgdesc="A JACK Equilisation tool designed primarily for live performance/work"
arch=('i686' 'x86_64')
url="http://djcj.org/jackeq/"
license=('GPL')
depends=('gtk2' 'jack' 'swh-plugins')
makedepends=('libxml2' 'desktop-file-utils')
install="$pkgname.install"
source=("${url}code/$_name-$pkgver.tar.bz2" $pkgname.desktop)
md5sums=('3417a59b0483232da8fff7d798919615'
         '01ba72987ef39a874d2787f26ffe9f49')

build() {
  cd "$srcdir/$_name-$pkgver"
  LDFLAGS+=" -ldl" \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir/" install

  # desktop file
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 pixmaps/logo-jackeq-s.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

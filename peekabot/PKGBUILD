# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=peekabot
pkgver=0.8.6
pkgrel=1
pkgdesc="A distributed real-time 3D visualization tool for robotics researchers and developers."
arch=(i686 x86_64)
url="http://www.peekabot.org/"
license=('custom:Boost Software License')
depends=('gtkglextmm' 'xerces-c' 'boost-libs')
makedepends=('boost')
options=('!libtool')
source=("http://download.sourceforge.net/project/$pkgname/$pkgname/0.8.x/$pkgname-$pkgver.tar.bz2")
md5sums=('3b988da5467fd72fdb108b55696afbd3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 LICENSE_1_0.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

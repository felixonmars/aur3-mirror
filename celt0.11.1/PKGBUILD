# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Ray Rashif <schivmeister@gmail.com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=celt0.11.1
_basename=celt
pkgver=0.11.1
pkgrel=1
pkgdesc="Low-latency audio communication codec - SPICE version"
arch=(i686 x86_64)
url="http://www.celt-codec.org"
license=('BSD')
depends=('libogg')
provides=('celt=0.11.1')
options=('!libtool')
source=(http://downloads.us.xiph.org/releases/$_basename/$_basename-$pkgver.tar.gz)
md5sums=('94fe4acd241da8702c295bcd13a555e6')

build() {
  cd "$srcdir/$_basename-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/BSD"
}


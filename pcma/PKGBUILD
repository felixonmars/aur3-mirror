# Maintainer: Pierre Carrier <pierre@spotif.com>
pkgname=pcma
_ghuser=spotify
pkgver=0.2.0
_pkgid=89bda25
pkgrel=1
pkgdesc="Page Cache My Assets"
arch=(i686 x86_64)
url="https://github.com/spotify/pcma"
license=('ISC')
depends=(zeromq msgpack glib2)
makedepends=(systemd)
source=("https://github.com/$_ghuser/$pkgname/tarball/v$pkgver")
md5sums=('e982389722fe20d4acff5e7ef2ed98da')

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  ./prepare.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  make DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/pcma/COPYING"
}

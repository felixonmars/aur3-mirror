# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Maintainer: Leslie P. Polzer <polzer@gnu.org>

pkgname=exepak
pkgver=1.5
pkgrel=1
pkgdesc="ELF executable compressor. An alternative to UPX."
arch=('i686')
depends=()
license=('GPL')
url="http://exepak.sourceforge.net/"
source=("http://downloads.sourceforge.net/project/exepak/exepak/exepak-1.5/exepak-1.5.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1

  mkdir -p $pkgdir/usr/bin
  install -m755 exepak $pkgdir/usr/bin
}
md5sums=('89ccb0791390368a5b60a78fec89fd43')
sha1sums=('f9f22d648d3b14f57e8de3a349ed54def4759f0b')

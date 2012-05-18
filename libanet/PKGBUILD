# Maintainer: Julian Leyh <julian@vgai.de>

pkgname=libanet
pkgver=0.1
pkgrel=1
pkgdesc="Ada Networking Library"
arch=(i686 x86_64)
url="http://www.codelabs.ch/anet/index.html"
license=('GMGPL')
depends=(gcc-ada)
checkdepends=(socat)
source=(http://www.codelabs.ch/download/$pkgname-$pkgver.tar.bz2)
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k tests
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
md5sums=('a1504a0e165d61434d5ccd134fed4491')

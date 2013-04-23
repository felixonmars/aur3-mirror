# Maintainer: Markus Heuser <markus.heuser@web.de
# Contributor: Markus Heuser <markus.heuser@web.de>

pkgname=dia2code
pkgver=0.8.5
pkgrel=1
pkgdesc="Generates code in various languages from your Dia drawings"

arch=('x86_64' 'i686')
url="http://dia2code.sourceforge.net/"
license=('GPL')
groups=
provides=()
depends=(libxml2)
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://downloads.sourceforge.net/dia2code/$pkgname-$pkgver.tar.gz)
md5sums=('482480ae0738f9618d48d47b4f5627cd')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=$pkgdir/usr install
}

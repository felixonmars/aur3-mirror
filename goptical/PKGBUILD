# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=goptical
pkgver=1.0
pkgrel=2
pkgdesc="The GNU Optical design and simulation library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/goptical/"
license=('GPL3')
depends=("gsl")
options=(libtool)
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-tests || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

md5sums=('a65d1dc6af36d481ef8ea34a0ccd9823')

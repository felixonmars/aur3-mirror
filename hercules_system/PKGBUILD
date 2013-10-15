# Contributor: perlawk

pkgname=hercules_system
_pkgname=hercules
pkgver=3.09
pkgrel=1

pkgdesc="Hercules is an open source software implementation of the mainframe System/370 and ESA/390 architectures, in addition to the latest 64-bit z/Architecture. Hercules runs under Linux, Windows, Solaris, FreeBSD, and Mac OS X."
arch=( 'x86_64')
url=(http://www.hercules-390.eu/)

license=('Q Public Licence')
depends=() 
source=( "http://downloads.hercules-390.eu/${_pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix="/usr"
  make -j4 
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
md5sums=('f2feb2801acd308bd23c30ad0cfd0075')

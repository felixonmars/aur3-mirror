# Maintainer: J. Andrew Lanz-O'Brien <jlanzobr@gmail.com>
# Contributor: J. Andrew Lanz-O'Brien <jlanzobr@gmail.com>

pkgname=dap
pkgver=3.10
pkgrel=1
pkgdesc="SAS-compatible statistics application."
arch=('any')
url="http://www.gnu.org/software/dap/"
license=('GPL3')
depends=()
source=(http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('1e876517f58ff1dda1d158affc36dd2d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

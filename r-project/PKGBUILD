# Maintainer: Thomas Holden <thomash@jegerprov.no>
pkgname=r-project
pkgver=3.1.1
pkgrel=1
pkgdesc="R is a free software environment for statistical computing"
arch=('x86_64' 'i686')
url="http://www.r-project.org/"
license=('GPL')
groups=()
depends=('pango' 'cairo' 'gcc-fortran')
makedepends=()
optdepends=('pdflatex: To have manual files in PDF format')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://cran.r-project.org/src/base/R-3/R-3.1.1.tar.gz)
noextract=()
md5sums=('2598f5bbbedb00e463e0c1385e6fe999')

build() {
  cd "$srcdir/R-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/R-$pkgver"

  make DESTDIR="$pkgdir/" install
}

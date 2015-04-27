# Maintainer: Snaipe

pkgname=criterion
pkgver=1.2.1
pkgrel=1
pkgdesc="A KISS, non-intrusive C unit testing framework."
arch=('i686' 'x86_64')
url="http://github.com/Snaipe/${pkgname}.git"
license=('MIT')
depends=('glibc')
source=("https://github.com/Snaipe/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd ${srcdir}/Criterion-${pkgver}

  # this dirty hack is here until the shared library support comes
  curl -Lo dependencies/csptr/v2.0.2.tar.gz https://github.com/Snaipe/libcsptr/archive/v2.0.2.tar.gz
  cd dependencies/csptr/
  tar -xzf v2.0.2.tar.gz --strip 1
  cd ../../

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/Criterion-${pkgver}
  make DESTDIR=$pkgdir LIBDIR=$pkgdir/usr/lib install
}

md5sums=('6c8b931534ac381aaf63051acca1f0ac')

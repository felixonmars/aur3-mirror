# Maintainer: xantares <xantares09 at hotmail dot com>

pkgname=openturns-svm
pkgver=0.0
pkgrel=2
pkgdesc="OpenTURNS SVM library extension module"
arch=('i686' 'x86_64')
url="http://www.openturns.org"
license=('LGPL3')
depends=('openturns' 'libsvm' 'python')
makedepends=('cmake' 'gcc' 'openturns' 'libsvm' 'python' 'texlive-latexextra')

build() {
  svn co https://svn.openturns.org/openturns-modules/openturns-svm/trunk "$srcdir/$pkgname-$pkgver" --non-interactive --trust-server-cert
  cd "$srcdir/$pkgname-$pkgver"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DSYSTEM_INSTALL=ON \
          -DUSE_INTERNAL_LIBSVM=OFF
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

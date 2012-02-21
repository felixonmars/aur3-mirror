# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=nfqueue-bindings
pkgver=0.3
pkgrel=1
pkgdesc="Python bindings for libnetfilter_queue by Pierre Chifflier"
url="https://www.wzdftpd.net/redmine/projects/nfqueue-bindings/wiki/"
arch=('any')
license=('GPL')
depends=('python2' 'libnetfilter_queue')
makedepends=('python2-distribute' 'cmake' 'swig')
source=(
  http://ftp.de.debian.org/debian/pool/main/n/nfqueue-bindings/nfqueue-bindings_0.3.orig.tar.gz
  python-support.patch)
md5sums=('279a78f132ddfc852ba09c3db84120d5'
         'c6156acc46ea237985bd6520b2d13251')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # this patch removes perl and forces a python2 build
  patch -p1 -i ../python-support.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install the examples
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/examples/"
  cp examples/*.py "$pkgdir/usr/share/doc/$pkgname/examples/"

  # install the library
  make PREFIX="$pkgdir/usr" install
}

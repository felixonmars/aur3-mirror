# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python2-ethumb
_pkgname=python-ethumb
pkgver=1.7.0
pkgrel=2
pkgdesc="Python2 bindings for Ethumb"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl' 'python2')
makedepends=('cython2')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
sha256sums=('49d724a76769ca22ea8f7d540e0d0e7811924609f727996cba7fd232dcdf26fe')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    PYTHON=python2

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

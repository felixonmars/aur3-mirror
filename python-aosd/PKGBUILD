# Maintainer: NSB <nsbrunet@gmail.com>

pkgname=python-aosd
pkgver=0.2.3
pkgrel=1
pkgdesc="Python bindings for libaosd"
arch=('i686' 'x86_64')
url="http://code.google.com/p/python-aosd/"
license=('MIT')
depends=('libaosd' 'python2-cairo')
makedepends=('cython2')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=

source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('82fe27503d0428b5243dd171eceb67b8')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

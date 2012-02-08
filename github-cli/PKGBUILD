# Maintainer: Sebastian Wiesner <lunaryorn googlemail com>
pkgname=github-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="GitHub issue tracker client"
arch=('any')
url="http://packages.python.org/github-cli/"
license=('BSD')
depends=(python2 python-simplejson)
makedepends=(python2-distribute)
source=("https://github.com/jsmits/$pkgname/tarball/$pkgver")
md5sums=('7393352e405ad2bd552bae1ea8620592')
_gitcommit="57bb29f"
build() {
  cd "$srcdir/jsmits-$pkgname-$_gitcommit"
  python2 setup.py build
}

package() {
  cd "$srcdir/jsmits-$pkgname-$_gitcommit"
  python2 setup.py install --root="$pkgdir" -O1 
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

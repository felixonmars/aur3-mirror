# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python2-flask-docs
_pkgname=Flask
pkgver=0.10
pkgrel=1
pkgdesc="A set of HTML documentation for the Flask microframework"
arch=('any')
url="http://flask.pocoo.org/"
license=('BSD')
options=('docs' '!strip')
makedepends=('python2-sphinx' 'python2-flask')
source=("http://pypi.python.org/packages/source/F/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('92bc6b6ebd37d3120c235430a0491a15')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  sphinx-build2 docs html
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "$pkgdir/usr/share/doc/"
  cp -rf html "$pkgdir/usr/share/doc/python2-flask"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

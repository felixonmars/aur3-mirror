pkgname=python2-httpie
pkgver=0.3.0
pkgrel=2
pkgdesc="cURL for humans"
url="https://github.com/jkbr/httpie"
depends=('python2-requests>=0.10.1'
         'python2-certifi'
         'python2-chardet'
         'python2-pygments')
optdepends=('python2-oauthlib')
makedepends=('python2-distribute')
license=('BSD')
arch=('any')
source=("http://pypi.python.org/packages/source/h/httpie/httpie-$pkgver.tar.gz")

build() {
    cd $srcdir/httpie-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/httpie-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('0a78351bec90683c8057e4747f479cae')

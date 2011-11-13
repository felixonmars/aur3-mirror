pkgname=python2-fungiform
_realname=Fungiform
pkgver=0.1
pkgrel=1
pkgdesc="HTML Form Library for Python"
url="https://github.com/mitsuhiko/fungiform"
depends=('python2')
makedepends=('python2-distribute')
license=('custom: ISC')
arch=('any')
source=("http://pypi.python.org/packages/source/F/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('2e185dd1063bc7bd8024c35408004aa9')

build() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}

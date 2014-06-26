_pypiname=wheezy.template
pkgname=python-wheezy-template
pkgver=0.1.151
pkgrel=2
pkgdesc="A lightweight template library"
url="https://bitbucket.org/akorn/wheezy.template"
depends=('python' )
makedepends=('python3' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
md5sums=('a0d73c2c9ab11e819f9fc5d42c42cdb6')

build() {
    cd $srcdir/$_pypiname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pypiname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}

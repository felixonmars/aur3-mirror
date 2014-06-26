_pypiname=rq
pkgname=python-$_pypiname
pkgver=0.4.6
pkgrel=1
pkgdesc="RQ is a simple, lightweight, library for creating background jobs, and processing them."
url="https://github.com/nvie/rq/"
depends=('python' )
makedepends=('python3' )
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pypiname::1}/$_pypiname/$_pypiname-$pkgver.tar.gz")
md5sums=('45a32d7281c010a6a1fb860823b3b652')

build() {
    cd $srcdir/$_pypiname-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/$_pypiname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}

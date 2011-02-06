# Contributor: David Moore <davidm@sjsoft.com>
pkgname=python-functest
pkgver=0.8.6
pkgrel=1
pkgdesc="Functional test framework"
license=('APACHE')
arch=(i686 x86_64)
url="http://functest.pythonesque.org/"
depends=('python>=2.5')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/f/functest/functest-$pkgver.tar.gz")
md5sums=()

build() {
    cd $srcdir/functest-$pkgver
    python setup.py build || return 1
    python setup.py install --root=$pkgdir || return 1
}

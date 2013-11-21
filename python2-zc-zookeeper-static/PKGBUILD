# Maintainer: Michael Ivko <ivko.mv@gmail.com>
pkgname=python2-zc-zookeeper-static
pkgver=3.4.4
pkgrel=1
pkgdesc="ZooKeeper Python bindings"
url="http://pypi.python.org/pypi/zc-zookeeper-static"
license=('Apache')
arch=('any')
depends=('python2' )
source=('https://pypi.python.org/packages/source/z/zc-zookeeper-static/zc-zookeeper-static-3.4.4.zip')
md5sums=('279313ee03f6452606a36e41448c872a')

build() {
    cd $srcdir/zc-zookeeper-static-3.4.4
    python2 setup.py build
}

package() {
    cd $srcdir/zc-zookeeper-static-3.4.4
    python2 setup.py install --root="$pkgdir" --optimize=1
}

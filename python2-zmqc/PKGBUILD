pkgname=python2-zmqc
pkgver=0.0.1
pkgrel=1
pkgdesc="A small but powerful command-line interface to ØMQ."
url="http://zacharyvoase.github.com/zmqc/"
depends=('python2-argparse'
         'python2-pyzmq')
makedepends=('python2-distribute')
license=('(Un)license')
arch=('any')
source=("http://pypi.python.org/packages/source/z/zmqc/zmqc-$pkgver.tar.gz")

build() {
    cd $srcdir/zmqc-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/zmqc-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('f13a255896f1bd1a35ea22dc6a4cb817')

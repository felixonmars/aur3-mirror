# Maintainer: Olivier Mangin
pkgname=python2-sktalkbox
pkgver=0.2.5
pkgrel=1
pkgdesc="Talkbox, a set of python modules for speech/signal processing."
arch=('any')
url="http://scikits.appspot.com/talkbox"
license=('BSD')
depends=('python2-scipy')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/s/scikits.talkbox/scikits.talkbox-${pkgver}.tar.gz")
md5sums=('8d64926345608ed4721bed7e92db2ae8')

build() {
    cd $srcdir/scikits.talkbox-${pkgver}
    python2 setup.py install --root=$pkgdir/ || return 1
}

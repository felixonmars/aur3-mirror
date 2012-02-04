#Maintainer: Akshay Srinivasan<akshaysrinivasan@gmail.com>

pkgname=python-enthought-enable
pkgver=3.3.1
pkgrel=1
pkgdesc="Enable provides two related multi-platform packages for drawing GUI objects - Enable and Kiva."
arch=('i686' 'x86_64')
url="http://code.enthought.com/enable/"
provides=('enable' 'kiva')
source=("http://www.enthought.com/repo/ETS/Enable-$pkgver.tar.gz")
depends=('python-numpy>=1.1')
makedepends=('setuptools' 'swig' 'pyrex')
license=('BSD')
md5sums=('44d5fbb33a3637fefeba83f9804587b2')

build() {
    cd $srcdir/Enable-$pkgver
    python setup.py build -f install -f --root $pkgdir --prefix=/usr || return 1
}

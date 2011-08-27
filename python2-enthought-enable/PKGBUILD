#Maintainer: Akshay Srinivasan<akshaysrinivasan@gmail.com>

pkgname=python2-enthought-enable
pkgver=3.4.1
pkgrel=1
pkgdesc="Enable provides two related multi-platform packages for drawing GUI objects - Enable and Kiva."
arch=('i686' 'x86_64')
url="http://code.enthought.com/enable/"
provides=('enable' 'kiva')
source=("http://www.enthought.com/repo/ETS/Enable-$pkgver.tar.gz")
depends=('python-numpy>=1.1')
makedepends=('setuptools' 'swig' 'pyrex')
license=('BSD')
md5sums=('9f59bf589d90beda89129c5e6386c775')

build() {
    cd $srcdir/Enable-$pkgver
    python2 setup.py build -f install -f --root $pkgdir --prefix=/usr || return 1
}

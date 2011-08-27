#Maintainer: Akshay Srinivasan<akshaysrinivasan@gmail.com>

pkgname=python-enthought-chaco
pkgver=3.3.1
pkgrel=1
pkgdesc="Chaco is a Python plotting application toolkit that facilitates writing plotting applications at all levels of complexity."
arch=('i686' 'x86_64')
url="http://code.enthought.com/projects/chaco"
provides=('chaco2')
source=("http://www.enthought.com/repo/ETS/Chaco-$pkgver.tar.gz")
depends=('python-numpy>=1.1' 'python-enthought-enable')
makedepends=('setuptools')
license=('BSD')
md5sums=('9471f96b723146313bb85e017bdde510')

build() {
    cd $srcdir/Chaco-$pkgver
    python setup.py build -f install -f --root $pkgdir --prefix=/usr || return 1
}

#Maintainer: Tondu <thomas.gastine at wanadoo.fr>

pkgname=python-enthought-utils
pkgver=4.0.0
pkgrel=1
pkgdesc="Enthought libraries needed to use Mayavi2 (AppTools, Envisage)"
arch=('i686' 'x86_64')
url="http://code.enthought.com/projects/mayavi"
provides=('apptools' 'envisage')
source=("http://www.enthought.com/repo/ETS/apptools-$pkgver.tar.gz"
        "http://www.enthought.com/repo/ETS/envisage-$pkgver.tar.gz")
depends=('python2')
makedepends=('setuptools' 'pyrex' 'python-sphinx')
license=('GPL')
md5sums=('e2824ca382bb31859852149cc843a118'
         '3738065fce77f780cf0d82d53c350b9f')

build() {
    # Install AppTools 
    cd $srcdir/apptools-$pkgver
    python2 setup.py build install --root $pkgdir --prefix=/usr || return 1
    # Install EnvisageCore 
    cd $srcdir/envisage-$pkgver
    python2 setup.py build install --root $pkgdir --prefix=/usr || return 1
}

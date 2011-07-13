#Maintainer: Tondu <thomas.gastine at wanadoo.fr>

pkgname=python-enthought-traits
pkgver=4.0.0
pkgrel=1
pkgdesc="User interface related modules for enthought traits. The traits package provides a metaclass with special attributes that are called traits."
arch=('i686' 'x86_64')
url="http://code.enthought.com/projects/traits"
provides=('traits' 'traitsui' 'pyface')
source=("http://www.enthought.com/repo/ETS/traits-$pkgver.tar.gz"
        "http://www.enthought.com/repo/ETS/traitsui-$pkgver.tar.gz"
	"http://www.enthought.com/repo/ETS/pyface-$pkgver.tar.gz")
        
depends=('python2' 'wxpython' 'python-numpy>=1.1')
makedepends=('setuptools' 'pyrex' 'python-sphinx')
license=('GPL')
md5sums=('67365bf53b030f176f93678bb9316a0d'
         'e8c10dd317ce22c3353ee14b57995cc0'
	 'e59032f78ef78d242d2af4c992c9879c')
	 

build() {
    # install traits
    cd $srcdir/traits-$pkgver
    python2 setup.py install --root $pkgdir --prefix=/usr || return 1
    # install traitsui 
    cd $srcdir/traitsui-$pkgver
    python2 setup.py install --root $pkgdir --prefix=/usr || return 1
    # install pyface
    cd $srcdir/pyface-$pkgver
    python2 setup.py install --root $pkgdir --prefix=/usr || return 1
}

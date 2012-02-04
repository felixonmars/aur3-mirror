#Maintainer: Tondu <thomas.gastine at wanadoo.fr>

pkgname=python-enthought-mayavi
pkgver=4.0.0
pkgrel=1
pkgdesc="MayaVi is a Python application using The Visualization Toolkit. It also provides modules which are a handy interface to VTK internals in Python."
arch=('i686' 'x86_64')
url="http://code.enthought.com/projects/mayavi"
provides=('mayavi2' 'tvtk')
source=("http://www.enthought.com/repo/ETS/mayavi-$pkgver.tar.gz")
depends=('vtk>=5.0' 'python-enthought-traits>=3.0' 'python-numpy>=1.1' 'wxpython' 'python-enthought-utils>=3.0' 'python-configobj' 'setuptools')
makedepends=('pyrex')
license=('custom')
md5sums=('bea9a501d552d8ac640553dd13c83e84')

build() {
    cd $srcdir/mayavi-$pkgver
    python2 setup.py build -f install -f --root $pkgdir --prefix=/usr || return 1
    install -D -m644 LICENSE.txt $pkgdir/usr/share/licences/${pkgname}/LICENSE
}

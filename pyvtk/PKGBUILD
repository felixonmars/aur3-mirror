# Contributor: Melancholy_Dream <Melancholy_Dream@write.su>
# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=pyvtk
pkgver=0.4.74
pkgrel=2
pkgdesc="tools for manipulating VTK files in Python"
arch=('any')
url="http://cens.ioc.ee/projects/pyvtk/"
license=('GPL')
depends=('python2')
source=(http://cens.ioc.ee/projects/pyvtk/rel-0.x/PyVTK-$pkgver.tar.gz)
md5sums=('ccbfe28ba3b2f8ffc07f8c25a224574e')

package() {
    cd "$srcdir/PyVTK-$pkgver"

    python2 setup.py build
    python2 setup.py install --root=$pkgdir
}

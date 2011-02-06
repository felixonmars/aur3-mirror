# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-dirac
pkgver=0.0.1
pkgrel=2
pkgdesc="Python bindings for Dirac"
url="http://kamaelia.sourceforge.net"
depends=('python' 'dirac')
makedepends=('pyrex')
source=(http://dl.sourceforge.net/kamaelia/Dirac-$pkgver.tar.gz \ 
        setup.patch)
md5sums=('e2e925d72b249d33fb40c8739179925c' 'd8dcbd6511caffa46796f53e34f5d8fa')
build() {
  cd $startdir/src/Dirac-$pkgver
  patch -p1 -i ../setup.patch
  python setup.py install --root=$startdir/pkg
}

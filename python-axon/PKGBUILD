# Contributor: William Rea <sillywilly@gmail.com>
pkgname=python-axon
pkgver=1.5.1
pkgrel=1
pkgdesc="Asynchronous Isolated Generator Component System"
url="http://kamaelia.sourceforge.net"
license="LGPL"
depends=('python')
source=(http://dl.sourceforge.net/sourceforge/kamaelia/Axon-$pkgver.tar.gz)
md5sums=('df338c943612b147fa212b10ea4adcc9')

build() {
  cd $startdir/src/Axon-$pkgver
  python setup.py install --root=$startdir/pkg
}

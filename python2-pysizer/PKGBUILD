# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
pkgname=python2-pysizer
pkgver=0.1.1
pkgrel=1
pkgdesc="a memory profiler for Python"
arch=(i686 x86_64)
url="http://pysizer.8325.org"
license=('GPL')
depends=('python2')
optdepends=('pyrex: for accurate counting of all types')
source=($url/dist/sizer-$pkgver.tar.gz)
md5sums=('d61a352523220561be465505e2dbc547')

build() {
  cd $startdir/src/sizer-$pkgver
  python2 ./setup.py install --root=$pkgdir
}

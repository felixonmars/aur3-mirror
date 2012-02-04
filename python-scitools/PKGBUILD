# Contributor: zimt email: $MYNICKNAME at enveng dot de
pkgname=python-scitools
pkgver=0.8
pkgrel=1
pkgdesc="python lybrary for scientific computing"
arch=(any)
url="http://code.google.com/p/scitools/"
license=('CUSTOM')
depends=('python2') 
makedepends=('python2' 'python-numpy' 'gnuplot-py')
optdepends=('python-scipy' 'python-scientific' 'python-numeric' 'python-numarray' 'gnuplot:for visualization' 'vtk:for visualization')
source=(http://scitools.googlecode.com/files/scitools-$pkgver.tar.gz)
md5sums=('8b8d0cc938616ef444f6b3cdb8cd26a8')

build() {
  cd "$srcdir/scitools-$pkgver"
  python2 setup.py install --prefix=/usr --root=$startdir/pkg || return 1
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
  install -m644 $srcdir/scitools-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}


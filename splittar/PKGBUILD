# Contributor: juantascon

pkgname=splittar
pkgver=0.2
pkgrel=2
pkgdesc="splittar is a small utility written in Python. It will create multiple tar files from a set of data with each tar file being limited in size"
url="http://atlee.ca/blog/2006/01/26/splittar/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('python')
source=("http://atlee.ca/software/splittar/${pkgname}_${pkgver}.tar.gz")
md5sums=('e88aa1aa3d3d954c1c3c53a7a469b182')

build() {
  #Build and install the package
  cd $srcdir/${pkgname}-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir
}


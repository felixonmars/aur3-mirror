# Contributor: mentallaxative <laxatives@gmail.com>
#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=fui
pkgver=0.0.7
pkgrel=3
pkgdesc="An utility for selecting and copying files on the command line"
arch=('i686')
url="http://pypi.python.org/pypi/fui"
license=('GPL')
depends=('python')
source=("http://pypi.python.org/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('114022b1d76df0fc97c1853d6fd1c5c9')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py install --root=${pkgdir}
 }

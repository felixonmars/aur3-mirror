# Maintainer: yescalona <yescalona en ug punto uchile punto cl>
pkgname=python-statistics  
_pkgname=statistics
pkgver=0.19
pkgrel=1 
pkgdesc="Statistics for Python is an extension module for Python that implements some commonly used statistical tools."
url="http://bonsai.hgc.jp/~mdehoon/software/python/Statistics/"
arch=('any')
license=('MIT')
depends=('python')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=($url/$_pkgname-$pkgver.tar.gz)
md5sums=('6dac7f869c092cdd2b50450758d5bf36')

build() {
  cd $startdir/src/$_pkgname-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=python-fchksum
pkgver=1.7.1
pkgrel=3
pkgdesc="Python module to find the checksum of files"
arch=('any')
url="http://www.dakotacom.net/~donut/programs/fchksum.html"
license=('GPL')
depends=('python')
source=(http://www.dakotacom.net/~donut/programs/fchksum/$pkgname-$pkgver.tar.gz)
md5sums=('5a7fdec9b6a04ef6d17962df2a74284b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python ./setup.py install --root=$startdir/pkg
}

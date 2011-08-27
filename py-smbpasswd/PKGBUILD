# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=py-smbpasswd
pkgver=1.0.1
pkgrel=2
pkgdesc="SMB Password Hash Generator"
arch=(i686)
url="http://barryp.org/software/py-smbpasswd/"
license=('GPL')
depends=('python')
source=(http://barryp.org/static/software/download/py-smbpasswd/1.0.1/$pkgname-$pkgver.tar.gz)
md5sums=('0eab2c29588e32e77ce6e5d2faea7874')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python ./setup.py install --root=$startdir/pkg
}

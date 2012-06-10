# Contributor: Enrico Morelli <morelli@cerm.unifi.it>
pkgname=python2-smbpasswd
pkgver=1.0.2
pkgrel=1
pkgdesc="SMB Password Hash Generator"
arch=(i686 x86_64 arm)
url="http://barryp.org/software/py-smbpasswd/"
license=('GPL')
depends=('python2')
source=("http://barryp.org/static/media/software/download/py-smbpasswd/$pkgver/smbpasswd-$pkgver.tgz")
md5sums=('57c1b99c16cad358f9573fc040289e9e')

build() {
  cd $startdir/src/smbpasswd-$pkgver
  python2 ./setup.py install --root=$startdir/pkg
}

# Maintainer: Sturmgewehr  

pkgname=insserv
pkgver=1.12.0
pkgrel=2
pkgdesc="OpenSUSE utility for starting and stopping services"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+archive/primary/+files"
license=('GPL')
groups=('system')
depends=('gcc')
source=(${url}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('1325bd2b728ba99f2a9aef144f31d7cb')

build() {
  msg "Starting build"
  cd $pkgname-$pkgver
  make
  make DESTDIR="$pkgdir"
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

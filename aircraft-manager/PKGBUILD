# Contributor: L0cutus <mie.iscrizioni@gmail.com>
pkgname=aircraft-manager
pkgver=12.1
pkgrel=1
pkgdesc="Dell released Aircraft Manager, a program for turning wireless devices off"
arch=('i686' 'x86_64')
url="http://www.ubuntumini.com/2008/12/aircraft-manager-save-battery-by.html"
license=('GPL')
depends=('portio' 'python>=2.6')
source=(https://launchpad.net/~opensource-subakutty/+archive/ppa/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('ba72d94fb7f936594216731cc022893a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}

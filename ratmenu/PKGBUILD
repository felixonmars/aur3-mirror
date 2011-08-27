#Mantainer: Jacob Schares  <jacob.schares@gmail.com>
# Contributor: Michal Docekal <docekal@gmail.com>
pkgname=ratmenu
pkgver=2.3.20
pkgrel=1
pkgdesc="Ratmenu is a menu generator for Ratposion."
arch=('i686' 'x86_64')
url="http://packages.debian.org/"
license=('GPL')
depends=()
makedepends=('gcc' 'make')
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
source=("http://ftp.de.debian.org/debian/pool/main/r/ratmenu/${pkgname}_$pkgver.tar.gz")
md5sums=('26a1c00f4e36e383ee937cf0488444e4')

build() {
	#cd $startdir/src/$pkgname-$pkgver
	cd $startdir/src/$pkgname-2.3.14
	make PREFIX=/usr || return 1
	make PREFIX=${startdir}/pkg/usr install || return 1
}

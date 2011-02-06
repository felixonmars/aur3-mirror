# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=stick2xyz
pkgver=1.3.1
pkgrel=1
pkgdesc="A useful utility for producing stick figure animations, and then afterwords output the animations to formats such as a K-3D file and 8-bit PNG files."
arch=('i686')
url="http://www.planetsaphire.com/"
depends=('libpng')
#makedepends=('')
license=('GPL')
source=(http://downloads.sourceforge.net/stick2xyz/stick2xyz-1.3.1.tar.bz2)
md5sums=('c72f2607d0ee66efb98176e73175b3ec')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure -prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install 
}

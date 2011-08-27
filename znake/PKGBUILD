#Maintainer: Ulven <ulven101@gmail.com>
pkgname=znake
pkgver=1.18
pkgrel=1
pkgdesc="Just another clone of snake, but including the Soviet Russia mode" 
url="http://sourceforge.net/projects/znake-ulven/"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('ncurses')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://downloads.sourceforge.net/project/znake-ulven/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d98ddd294ad0d6f2a558f9a8bcb9525d')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/bin"
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir/usr/bin/" install
	}

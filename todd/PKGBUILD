# Maintainer: Brad Fanella <bradfanella@archlinux.us>

pkgname=todd
pkgver=0.5.2
pkgrel=1
pkgdesc="A lightweight command-line todo list program written in C"
arch=('i686' 'x86_64')
url="http://bradfanella.co.cc/todd/"
license=('MIT')
depends=()
source=(http://bradfanella.co.cc/${pkgname}/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('c193c936074aa91c74b85382bcbf50ea')

build() {
	cd ${pkgname}
	make
}	

package() {
	cd ${pkgname}	
	make DESTDIR="${pkgdir}" install

	# License
	mkdir -p ${pkgdir}/usr/share/licenses/todd/
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/todd/
}

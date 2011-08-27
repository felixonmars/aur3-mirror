pkgname="valaswig"
pkgver=0.4
pkgrel=1
pkgdesc="ValaSwig is a tool to parse vala or vapi files to transform
them into swig interface files."
arch=('i686' 'x86_64')
url="http://radare.org"
license=('GPL2')
depends=('vala' 'swig')
provides=("valaswig")
source=(http://radare.org/get/${pkgname}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make all|| return 1
		
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install || return 1
}

sha256sums=('28e8f1f814968508c679b412025ce01c59ce2c79eef8b720bf0ec8a53c77fcba')

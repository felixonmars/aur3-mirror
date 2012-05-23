# Maintainer: Vinycius Maia <suportevg@uol.com.br>

pkgname=gtk-thinice-engine
pkgver=2.0.2
pkgrel=2
pkgdesc="A theme engine for GTK+ designed to be fast, lean and clean."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/thinice/"
license=('GPL')
depends=('gtk2')
conflicts=('gtk-engines')
options=('!libtool')
source=( 'http://downloads.sourceforge.net/project/thinice/thinice2/2.0.2/gtk-thinice-engine-2.0.2.tar.gz' )
md5sums=( '3956787e5e570946f8930bdf42099023' )

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr 
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -d "${pkgdir}/usr/share/themes"
}

# Maintainer: Martynas Januskauskas <martynas@januskauskas.eu>
pkgname=fgx
pkgver=2.8.0
pkgrel=3
pkgdesc="Launcher for free and open source FlightGear Flight Simulator, based on Qt (binary from Debian package)"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt')
makedepends=('binutils' 'wget' 'tar' 'coreutils')
conflicts=('fgx-git')
replaces=('fgx-git')
provides=('fgx')
source=('fgx.png'
		'fgx.desktop')
sha512sums=('c5c4ef240a18a4f162ae55ce5669ca82f0b8a869d696f6c873da880dc0f52c8b44c97651813aa2d6b07279d56ad784f4ae94eb1627d607e2c5d5515cc66011de'
            '38ccaa94a6fc0b84a51a0a6f1d2b31d47e2e8f453be6c3d70932d97ad48f90874b46e40e18def29ebc089c87b0aa4aa97f6bf5f7c7111fce38327bf9d146115b')
url="http://www.fgx.ch/"

build() {
	# get the deb
	wget http://downloads.fgx.ch/debian/fgx_2.8.0-1_all.deb -O ${srcdir}/fgx_2.8.0-1_all.deb
	
	# extract
	ar xv fgx_2.8.0-1_all.deb
	mkdir ${srcdir}/deb_temp
	cd ${srcdir}/deb_temp
	tar xf ${srcdir}/data.tar.gz
	cd ${srcdir}
	
}

package() {
	install -m655 -D "${srcdir}/deb_temp/usr/bin/FGx" "${pkgdir}/usr/bin/fgx"
	install -m644 -D "${srcdir}/fgx.png" "${pkgdir}/usr/share/pixmaps/fgx.png"
	install -m644 -D "${srcdir}/fgx.desktop" "${pkgdir}/usr/share/applications/fgx.desktop"
}

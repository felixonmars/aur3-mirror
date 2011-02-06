# Contributor: Fernando Henrique <arch at liquuid dot net> 
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=orthos
pkgver=0.2
pkgrel=1
pkgdesc="An X Display Manager with simplistic design and no need for qt/gtk/other libraries"
url="http://exa.czweb.org/?view=orthos"
depends=( 'sdl' 'mesa' )
makedepends=('scons')
license=('GPL3')
arch=('i686' 'x86_64')
source=(http://exa.czweb.org/releases/${pkgname}-${pkgver}.tar.bz2 odm)
md5sums=('d8f008e98901d7bf783fa652bdd3e1d2' '833ed8d171e0958e1d33c2cfe45abc56')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	scons
	install -Dm 755 orthos ${pkgdir}/usr/bin/orthos
	install -Dm 644 skins/libdefault.so  ${pkgdir}/usr/lib/orthos-default.so
	install -Dm 755 ${srcdir}/odm  ${pkgdir}/etc/rc.d/odm
	echo -e "Xserver\t/usr/bin/Xorg\nskin\t/usr/lib/orthos-default.so" >>  ${pkgdir}/etc/orthos.conf
}


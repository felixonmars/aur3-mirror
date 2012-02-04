# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=openfracas
pkgver=0.6.1
pkgrel=1
pkgdesc="A game similar to Risk, based on the discontinued Fracas"
url="http://www.openfracas.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('ruby' 'ruby-sdl' 'ruby-libglade' 'sdl_mixer')
source=( "http://download.openfracas.org/${pkgname}-nomusic.zip" )
md5sums=('c576fb64c951b0b5ef6f4f6be89cfc6a')

build() {
	cd ${srcdir}
	rm -rf {Affero\ GPLv3,License}.txt Help
	sed -i  usr-bin/* \
		-e s,share/games,share,
	mkdir -p ${pkgdir}/usr/{bin/,share/${pkgname}} || return 1
	install -m755 ${srcdir}/usr-bin/openfracas ${pkgdir}/usr/bin || return 1
	rm -rf ${srcdir}/usr-bin
	rm ${pkgname}-nomusic.zip
	mv ${srcdir}/* ${pkgdir}/usr/share/${pkgname}/
}

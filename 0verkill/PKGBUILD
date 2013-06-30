# Maintainer: Diogo Leal <estranho@diogoleal.com>
# Contribuitor: Marcin Karpezo <sirmacik@gmail.com>
# Contributor: Petr Kulhavy <brain@artax.karlin.mff.cuni.cz>
# Contributor: Bartosz Dusilo <cbreaker@tlen.pl>
pkgname=0verkill
pkgver=0.16
pkgrel=7
pkgdesc="Bloody 2D online deathmatch game created in ASCII-ART"
arch=('i686' 'x86_64')
license=('GPL')
url=("http://artax.karlin.mff.cuni.cz/~brain/0verkill/")
source=(http://artax.karlin.mff.cuni.cz/~brain/0verkill/release/0verkill.tgz 
    0verkill
    0verkill_server)
depends=('glibc')
md5sums=('814097fc21a82723a40ec8ae5dd792a7'
    '3df375d85988923828993612c7992270'
    '8f5a607e8115f783018b899ac669d66c')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure 
}

package(){
	cd ${srcdir}/${pkgname}-${pkgver}
	make || return 1 
	mkdir -p ${pkgdir}/usr/{bin,share}
	mv -v ${srcdir}/${pkgname}-${pkgver}/ \
        ${pkgdir}/usr/share/
	chmod 755 ${pkgdir}/usr/share/${pkgname}-${pkgver}
	chmod 755 ${pkgdir}/usr/share/${pkgname}-${pkgver}/*
	chmod 755 ${pkgdir}/usr/share/${pkgname}-${pkgver}/data/*
	chmod 755 ${pkgdir}/usr/share/${pkgname}-${pkgver}/grx/*
	chmod 755 ${pkgdir}/usr/share/${pkgname}-${pkgver}/doc/*
	install -Dm 755 ${srcdir}/{0verkill,0verkill_server} ${pkgdir}/usr/bin
}

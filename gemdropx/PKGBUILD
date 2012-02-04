# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gemdropx
pkgver=0.9
pkgrel=5
pkgdesc="A addictive gemstone game" 
arch=('i686')
url="http://www.newbreedsoftware.com/gemdropx/" 
license=('GPL')
depends=('sdl_mixer') 
source=(ftp://ftp.billsgames.com/unix/x/gemdropx/src/${pkgname}-${pkgver}.tar.gz) 
md5sums=('fd0337e89778e2dba74461c555ea8e42')

build(){
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e"s:/local::g" Makefile
	make  DATA_PREFIX=/usr/share/games/gemdropx/data || return 1
	install -D -m755 gemdropx ${pkgdir}/usr/bin/gemdropx
	install -d -m755 data ${pkgdir}/usr/share/games/gemdropx/data
	cp -a data/* ${pkgdir}/usr/share/games/gemdropx/data
	find ${pkgdir} -name '*.la' -exec rm {} \;
}

# Maintainer: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=les-indemodables
pkgver=1.4.0
pkgrel=1
pkgdesc="Many command line games grouped under a nice menu (in french)."
arch=('i686' 'x86_64')
url="http://code.google.com/p/les-indemodables/" 
license="GPL"
depends=('sdl_mixer')
makedepends=('make' 'cslp')
source=(http://les-indemodables.googlecode.com/files/Sources%20Jeux%20Ind%C3%A9modables%201.4.0.zip les-indemodables.desktop conf.ini)
md5sums=('ba331a4929bf20015b5bf5cfe60d0b7b'
         'de8b8e509f8f97c7a419ff99473a8392'
         'd80259d47508bd3cd0d283cff7e73462')

build() { 
	cd ${srcdir}/src
	make
        mkdir -p ${pkgdir}/usr/bin  
        mkdir -p ${pkgdir}/usr/share/{applications,les-indemodables}
	mkdir -p -m777 ${pkgdir}/usr/share/les-indemodables/scores
        install -m755 les-indemodables ${pkgdir}/usr/share/les-indemodables
	echo "cd '/usr/share/les-indemodables/' && ./les-indemodables" > ${pkgdir}/usr/bin/les-indemodables.sh
	chmod 755 ${pkgdir}/usr/bin/les-indemodables.sh
	cp -fR {sons,niveaux,historiques.lst,credits.lst,playList.m3u} ${pkgdir}/usr/share/les-indemodables
	chmod 777 -R ${pkgdir}/usr/share/les-indemodables/niveaux/niveaux_perso
	install -m777 dico.ini ${pkgdir}/usr/share/les-indemodables
	install -m777 ../conf.ini ${pkgdir}/usr/share/les-indemodables
	install -m755 ../les-indemodables.desktop ${pkgdir}/usr/share/applications
}

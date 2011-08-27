# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=ggbot
pkgver=0.3.7
pkgrel=1
pkgdesc="Bot for gadu-gadu network"
license=('GPL')
url="http://harvester.iglu.cz/"
arch=('i686' 'x86_64')
depends=('python>=2.5' 'libgadu' 'openssl' 'readline')
makedepends=('python>=2.5' 'pkgconfig' 'libgadu' 'openssl' 'readline')
source=(http://harvester.iglu.cz/ggbot_037.tar.gz)
md5sums=('5c3423fa79eff08f0cb8dcafd2584c73')
build()
{
	mkdir -p ${startdir}/pkg/usr/{bin,share/ggbot}
	cd ${startdir}/src/ggbot
	./configure prefix="/usr"
	sed -i 's/#undef  HAVE_PYTHON/#define  HAVE_PYTHON 1/' ./src/config.h
	grep -v '@echo' ./Makefile | sed 's/${datadir}/${DESTDIR}${datadir}/g; s/${bindir}/${DESTDIR}${bindir}/g; s/\(LIBS =[.]*\)/\1 -L\/usr\/lib -L\/usr\/lib\/python2.5\/config -lpython2.5 /; s/\(INCLUDES =[.]*\)/\1 -I\/usr\/include\/python2.5 -I\/usr\/include /' > ./Makefile
	make || return 1
	make DESTDIR="${startdir}/pkg" install || return 1

}

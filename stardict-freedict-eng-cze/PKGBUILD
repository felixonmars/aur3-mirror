# Contributor: davidolf <davidolf@gmail.com>

pkgname=stardict-freedict-eng-cze
pkgver=2.4.2
pkgrel=1
pkgdesc="Freedict English - Czech dictionary for Stardict"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://www.freedict.org"
license=('GPL')
md5sums=('56e5bd665a3fa7793c9dbb90d8f3f034')
source=(http://heanet.dl.sourceforge.net/sourceforge/stardict/${pkgname}-${pkgver}.tar.bz2)

build() {
	cd $startdir/src/${pkgname}-$pkgver/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 dictd_www.freedict.de_eng-cze.dict.dz \
		dictd_www.freedict.de_eng-cze.idx \
		dictd_www.freedict.de_eng-cze.ifo \
		$startdir/pkg/usr/share/stardict/dic/
}

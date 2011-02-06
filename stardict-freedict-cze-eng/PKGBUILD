# Contributor: davidolf <davidolf@gmail.com>

pkgname=stardict-freedict-cze-eng
pkgver=2.4.2
pkgrel=1
pkgdesc="Freedict Czech - English dictionary for Stardict"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://www.freedict.org"
license=('GPL')
md5sums=('925748d8acd03efdef400c557d07aa9d')
source=(http://heanet.dl.sourceforge.net/sourceforge/stardict/${pkgname}-${pkgver}.tar.bz2)

build() {
	cd $startdir/src/${pkgname}-$pkgver/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 dictd_www.freedict.de_cze-eng.dict.dz \
		dictd_www.freedict.de_cze-eng.idx \
		dictd_www.freedict.de_cze-eng.ifo \
		$startdir/pkg/usr/share/stardict/dic/
}

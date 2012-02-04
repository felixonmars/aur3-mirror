# Contributor: Karel Piwko <karel.piwko@gmail.com>

pkgname=stardict-fr-fr
pkgver=2.4.2
pkgrel=1
pkgdesc="GNU/FDL French-French dictionary for StarDict"
arch=('i686' 'x86_64')
depends=('stardict')
url="http://stardict.sourceforge.net/Dictionaries_fr.php"
license=('FDL')
md5sums=('43243936adaf1b015a6ffffb96172dec')
source=(http://prdownloads.sourceforge.net/stardict/stardict-woaifayu-ff-$pkgver.tar.bz2)

build() {
	cd $startdir/src/stardict-woaifayu-ff-$pkgver/
	mkdir -p $startdir/pkg/usr/share/stardict/dic/
	install -m 644 woaifayu-ff.idx woaifayu-ff.ifo woaifayu-ff.dict.dz \
		$startdir/pkg/usr/share/stardict/dic/
}

# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=stardict-freedict-es-en
pkgver=2.4.2
pkgrel=2
pkgdesc="Spanish <-> English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_dictd-www.freedict.de.php"
depends=('stardict')
license=('GPL')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/freedict.de/stardict-freedict-spa-eng-2.4.2.tar.bz2
	http://www.huzheng.org/stardict-iso/stardict-dic/freedict.de/stardict-freedict-eng-spa-2.4.2.tar.bz2)
md5sums=('ba989336d3a58f19541f7b2ba0202237'
         '89d880ec5d473d77e0fa9eaa237f9c41')


build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-freedict-spa-eng-2.4.2/dictd_www.freedict.de_spa-eng.dict.dz \
$startdir/src/stardict-freedict-spa-eng-2.4.2/dictd_www.freedict.de_spa-eng.idx \
$startdir/src/stardict-freedict-spa-eng-2.4.2/dictd_www.freedict.de_spa-eng.ifo \
$startdir/src/stardict-freedict-eng-spa-2.4.2/dictd_www.freedict.de_eng-spa.dict.dz \
$startdir/src/stardict-freedict-eng-spa-2.4.2/dictd_www.freedict.de_eng-spa.idx \
$startdir/src/stardict-freedict-eng-spa-2.4.2/dictd_www.freedict.de_eng-spa.ifo \
$startdir/pkg/usr/share/stardict/dic/

}

# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=stardict-freedict-en-de
pkgver=2.4.2
pkgrel=1
pkgdesc="English <-> German dictionary for Stardict."
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_dictd-www.freedict.de.php"
license=('GPL')
source=(http://downloads.sourceforge.net/stardict/stardict-freedict-deu-eng-2.4.2.tar.bz2
	http://downloads.sourceforge.net/stardict/stardict-freedict-eng-deu-2.4.2.tar.bz2)
md5sums=('57a926e9ffd746e792fe48501ba7dfe0'
         '9162e85311b9117170ee19675c6d3491')

build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-freedict-deu-eng-2.4.2/dictd_www.freedict.de_deu-eng.dict.dz \
$startdir/src/stardict-freedict-deu-eng-2.4.2/dictd_www.freedict.de_deu-eng.idx \
$startdir/src/stardict-freedict-deu-eng-2.4.2/dictd_www.freedict.de_deu-eng.ifo \
$startdir/src/stardict-freedict-eng-deu-2.4.2/dictd_www.freedict.de_eng-deu.dict.dz \
$startdir/src/stardict-freedict-eng-deu-2.4.2/dictd_www.freedict.de_eng-deu.idx \
$startdir/src/stardict-freedict-eng-deu-2.4.2/dictd_www.freedict.de_eng-deu.ifo \
$startdir/pkg/usr/share/stardict/dic/

}

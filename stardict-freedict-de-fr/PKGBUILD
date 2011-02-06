# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=stardict-freedict-de-fr
pkgver=2.4.2
pkgrel=2
pkgdesc="German <-> French dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_dictd-www.freedict.de.php"
depends=('stardict')
license=('GPL')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/freedict.de/stardict-freedict-deu-fra-2.4.2.tar.bz2
	http://www.huzheng.org/stardict-iso/stardict-dic/freedict.de/stardict-freedict-fra-deu-2.4.2.tar.bz2)
md5sums=('ade2cdfde040df8c13c60d389e1aae41'
         '083ede413db8f2161c6d369fffd8697a')


build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-freedict-deu-fra-2.4.2/dictd_www.freedict.de_deu-fra.dict.dz \
$startdir/src/stardict-freedict-deu-fra-2.4.2/dictd_www.freedict.de_deu-fra.idx \
$startdir/src/stardict-freedict-deu-fra-2.4.2/dictd_www.freedict.de_deu-fra.ifo \
$startdir/src/stardict-freedict-fra-deu-2.4.2/dictd_www.freedict.de_fra-deu.dict.dz \
$startdir/src/stardict-freedict-fra-deu-2.4.2/dictd_www.freedict.de_fra-deu.idx \
$startdir/src/stardict-freedict-fra-deu-2.4.2/dictd_www.freedict.de_fra-deu.ifo \
$startdir/pkg/usr/share/stardict/dic/

}

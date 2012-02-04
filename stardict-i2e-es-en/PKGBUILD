# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=stardict-i2e-es-en
pkgver=2.4.2
pkgrel=2
pkgdesc="Spanish <-> English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_misc.php"
depends=('stardict')
license=('GPL')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/misc/stardict-e2i-2.4.2.tar.bz2
	http://www.huzheng.org/stardict-iso/stardict-dic/misc/stardict-i2e-2.4.2.tar.bz2)
md5sums=('382f80377357a64d67e5b9e732a36791'
         'dbe1092ac8f257dc7c6cfb2aa7903372')

build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic
install -m644 $startdir/src/stardict-e2i-2.4.2/e2i.dict.dz \
$startdir/src/stardict-e2i-2.4.2/e2i.idx \
$startdir/src/stardict-e2i-2.4.2/e2i.ifo \
$startdir/src/stardict-i2e-2.4.2/i2e.dict.dz \
$startdir/src/stardict-i2e-2.4.2/i2e.idx \
$startdir/src/stardict-i2e-2.4.2/i2e.ifo \
$startdir/pkg/usr/share/stardict/dic/

}

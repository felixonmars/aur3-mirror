# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=stardict-fr-daf8
pkgver=2.4.2
pkgrel=2
pkgdesc="Dictionnaire de l’Académie Française, 8ème édition (1935)"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_fr.php"
depends=('stardict')
license=('GPL')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/fr/stardict-Dico_result_38.xdxf-$pkgver.tar.bz2)
md5sums=('eccc166b30e198c97426fd73871e65b0')

build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic

cd $startdir/src/stardict-Dico_result_38.xdxf-$pkgver/
install -m 644 Dico_result_38.xdxf.idx Dico_result_38.xdxf.ifo Dico_result_38.xdxf.dict.dz \
$startdir/pkg/usr/share/stardict/dic/

}

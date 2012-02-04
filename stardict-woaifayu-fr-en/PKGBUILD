# Contributor: Juanma Hernández <juanmah@gmail.com>

pkgname=stardict-woaifayu-fr-en
pkgver=2.4.2
pkgrel=2
pkgdesc="French <-> English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net/Dictionaries_fr.php"
depends=('stardict')
license=('GPL')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/stardict-woaifayu-fe-$pkgver.tar.bz2
        http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/stardict-woaifayu-ef-$pkgver.tar.bz2)
md5sums=('2809919c142fe523fa827f98cb267f96'
         '49ed4ddf32532736234726b1bbbcbf6b')

build() {

mkdir -p $startdir/pkg/usr/share/stardict/dic

cd $startdir/src/stardict-woaifayu-fe-$pkgver/
# Changing chinese's dictionary's name to english
sed -i 's/bookname=.*/bookname=French-English/' woaifayu-fe.ifo
install -m 644 woaifayu-fe.idx woaifayu-fe.ifo woaifayu-fe.dict.dz \
$startdir/pkg/usr/share/stardict/dic/

cd $startdir/src/stardict-woaifayu-ef-$pkgver/
# Changing chinese's dictionary's name to english
sed -i 's/bookname=.*/bookname=English-French/' woaifayu-ef.ifo
install -m 644 woaifayu-ef.idx woaifayu-ef.ifo woaifayu-ef.dict.dz \
$startdir/pkg/usr/share/stardict/dic/

}

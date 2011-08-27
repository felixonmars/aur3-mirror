pkgname=stardict-en-fr
pkgver=2.4.2
pkgrel=1
pkgdesc="English-French dictionary for Stardict"
url="http://polyglotte.tuxfamily.org/doku.php?id=donnees:dicos_bilingues"
license=('GPL')
arch=('i686' 'x86_64')
depends=('stardict')
source=(http://yeelou.com/huzheng/stardict-dic/zh_CN/stardict-woaifayu-ef-$pkgver.tar.bz2)
md5sums=('49ed4ddf32532736234726b1bbbcbf6b')

build() {
	cd $srcdir/stardict-woaifayu-ef-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/
	
	install -m 644 woaifayu-ef.dict.dz woaifayu-ef.idx woaifayu-ef.ifo $pkgdir/usr/share/stardict/dic/
}

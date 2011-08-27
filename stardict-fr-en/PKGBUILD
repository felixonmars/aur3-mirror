pkgname=stardict-fr-en
pkgver=2.4.2
pkgrel=1
pkgdesc="French-English dictionary for Stardict"
url="http://polyglotte.tuxfamily.org/doku.php?id=donnees:dicos_bilingues"
license=('GPL')
arch=('i686' 'x86_64')
depends=('stardict')
source=(http://yeelou.com/huzheng/stardict-dic/zh_CN/stardict-woaifayu-fe-$pkgver.tar.bz2)
md5sums=('2809919c142fe523fa827f98cb267f96')

build() {
	cd $srcdir/stardict-woaifayu-fe-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/
	
	install -m 644 woaifayu-fe.dict.dz woaifayu-fe.idx woaifayu-fe.ifo $pkgdir/usr/share/stardict/dic/
}

# Maintainer: 謝致邦 <Yeking@Red54.com>

pkgname=stardict-oxford-gb
pkgver=2.4.2
pkgrel=4
pkgdesc="English Chinese dictionary Oxford-gb for Stardict"
license=('GPL')
depends=('stardict')
url="http://stardict.huzheng.org"
md5sums=('c175f9bcb88e7513380ad05b291a8a03')
source=(http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-oxford-gb-$pkgver.tar.bz2)    
arch=('any')

build() {
	cd $srcdir/stardict-oxford-gb-$pkgver
	mkdir -p $pkgdir/usr/share/stardict/dic/
	install -m 644 oxford-gb.dict.dz   $pkgdir/usr/share/stardict/dic/
	install -m 644 oxford-gb.idx       $pkgdir/usr/share/stardict/dic/
	install -m 644 oxford-gb.ifo       $pkgdir/usr/share/stardict/dic/
}

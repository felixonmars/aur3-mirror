# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-handedict
pkgver=2.4.2
pkgrel=1
pkgdesc="Chinesisch-Deutsches Wörterbuch für Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/$pkgname-gb-$pkgver.tar.bz2)
md5sums=('e9d55ca804a4ad7f2f6ab4d817ec26d4')

build() {
    cd $srcdir/$pkgname-gb-$pkgver
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 handedict-gb.dict.dz handedict-gb.idx handedict-gb.ifo \
	$pkgdir/usr/share/stardict/dic/
}

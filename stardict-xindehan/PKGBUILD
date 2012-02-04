# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-xindehan
pkgver=2.4.2
pkgrel=1
pkgdesc="Neues Deutsch-Chinesisches Wörterbuch für Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/$pkgname-$pkgver.tar.bz2)
md5sums=('4a22996107ae3a2fc54b6a28c67da7a8')

build() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 xindehan.dict.dz xindehan.idx xindehan.ifo \
	$pkgdir/usr/share/stardict/dic/
}

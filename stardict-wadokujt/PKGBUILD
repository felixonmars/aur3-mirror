# Contributor: nexus7 <MinsuKim at gmx _dot_net>
pkgname=stardict-wadokujt
pkgver=2.4.2
pkgrel=1
pkgdesc="WaDokuJT Japanisch-Deutsches Wörterbuch für Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/ja/stardict-wadokujt-2.4.2.tar.bz2)
md5sums=('6fd4f02be28570d4daf5d24472ad7609')

build() {
    cd $srcdir/$pkgname-$pkgver
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 wadokujt.dict.dz wadokujt.idx wadokujt.ifo \
	$pkgdir/usr/share/stardict/dic/
}

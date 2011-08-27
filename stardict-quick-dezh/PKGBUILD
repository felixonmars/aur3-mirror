# Contributor: nexus7
pkgname=stardict-quick-dezh
pkgver=2.4.2
pkgrel=1
pkgdesc="Quick Chinesisch-Deutsches Wörterbuch für Stardict"
arch=('any')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://www.huzheng.org/stardict-iso/stardict-dic/zh_CN/stardict-quick_de-zh_CN-$pkgver.tar.bz2)
md5sums=('3703b113e075a3b9e97a75b32b0368ea')

build() {
    cd $srcdir/stardict-quick_de-zh_CN-$pkgver
    mkdir -p $pkgdir/usr/share/stardict/dic/
    install -m 644 quick_de-zh_CN.dict.dz quick_de-zh_CN.idx quick_de-zh_CN.ifo \
	$pkgdir/usr/share/stardict/dic/
}

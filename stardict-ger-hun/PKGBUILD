# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-ger-hun
pkgver=2.4.2
pkgrel=1
pkgdesc="German-Hungarian Dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_ger_hung-2.4.2.tar.bz2)
md5sums=('832d345c0ee898ab3cecf084c6f3b25e')

build() {
        cd $srcdir/stardict-ger_hung-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 ger_hung.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 ger_hung.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 ger_hung.ifo       $pkgdir/usr/share/stardict/dic/
}

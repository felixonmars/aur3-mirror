# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-eng-hun
pkgver=2.4.2
pkgrel=1
pkgdesc="English-Hungarian dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_eng-hung-2.4.2.tar.bz2)
md5sums=('e6d4869b6e21ab50cffadf1a9aa52153')

build() {
        cd $srcdir/stardict-eng-hung-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 eng-hung.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 eng-hung.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 eng-hung.ifo       $pkgdir/usr/share/stardict/dic/
}

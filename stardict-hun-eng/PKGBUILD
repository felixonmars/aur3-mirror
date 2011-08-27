# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-hun-eng
pkgver=2.4.2
pkgrel=1
pkgdesc="Hungarian-English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_hungarian-english-2.4.2.tar.bz2)
md5sums=('fce2e2b4c5ada54527e7b1b8866267db')

build() {
        cd $srcdir/stardict-hungarian-english-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 hungarian-english.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 hungarian-english.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 hungarian-english.ifo       $pkgdir/usr/share/stardict/dic/
}

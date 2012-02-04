# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-quick-eng-hun
pkgver=2.4.2
pkgrel=1
pkgdesc="Quick English-Hungarian dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/stardict//stardict-quick_eng-hun-$pkgver.tar.bz2)
md5sums=('0e2c28807d8dfc412da42db1fea7be41')

build() {
        cd $srcdir/stardict-quick_eng-hun-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_english-hungarian.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_english-hungarian.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_english-hungarian.ifo       $pkgdir/usr/share/stardict/dic/
}

# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-quick-hun-eng
pkgver=2.4.2
pkgrel=1
pkgdesc="Quick Hungarian-English dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(ftp://ftp.freebsd.org/pub/FreeBSD/ports/distfiles/stardict//stardict-quick_hun-eng-$pkgver.tar.bz2)
md5sums=('f3bb2d8995c1386cace4b366fc14cf21')

build() {
        cd $srcdir/stardict-quick_hun-eng-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_hungarian-english.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_hungarian-english.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 quick_hungarian-english.ifo       $pkgdir/usr/share/stardict/dic/
}

# Maintainer: bertzi <bertzi87 AT yahoo DOT com>
pkgname=stardict-hun-eng-expressions
pkgver=2.4.2
pkgrel=1
pkgdesc="Hungarian-English Expressions Dictionary for Stardict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://downloads.sourceforge.net/xdxf/stardict-comn_sdict05_hung_eng_expr-2.4.2.tar.bz2)
md5sums=('b7d11dc63451fb244d50cf77d4e81cc2')

build() {
        cd $srcdir/stardict-hung_eng_expr-$pkgver
        mkdir -p $pkgdir/usr/share/stardict/dic/
        install -m 644 hung_eng_expr.dict.dz   $pkgdir/usr/share/stardict/dic/
        install -m 644 hung_eng_expr.idx       $pkgdir/usr/share/stardict/dic/
        install -m 644 hung_eng_expr.ifo       $pkgdir/usr/share/stardict/dic/
}

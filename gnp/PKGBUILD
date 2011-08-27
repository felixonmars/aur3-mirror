# Contributor: megadriver <megadriver at gmx dot com>

pkgname=gnp
pkgver=1.04
pkgrel=1
pkgdesc="Gambare Natsuki-san, a Japanese puzzle platformer inspired by cult classic Umihara Kawase"
arch=('i686' 'x86_64')
url="http://maglog.jp/alpha-secret-base/Article243291.html"
license=('custom')
depends=('sdl_mixer')
makedepends=('recode')
install=${pkgname}.install
source=("http://www.geocities.jp/dij4121/alpha/data/gnp_104.zip"
         $pkgname.sh $pkgname.png $pkgname.desktop)

md5sums=('9170ef8b38b81d8325199dc1935baba3'
         'c58d6ad54923fc210386e8a124321653'
         '6df40bbf4a63cc7d6d30bf22200f8eb7'
	 'dd5daa08d6babb945a03464d03e11b33')

build() {
    cd $srcdir/gnp_104
    make -f Makefile.linux clean || return 1
    make -f Makefile.linux || return 1
}

package() {
    cd $srcdir/gnp_104
    install -D -m755 $pkgname $pkgdir/opt/$pkgname/$pkgname
    cp -r data image replay save sound $pkgdir/opt/$pkgname
    recode SHIFT_JIS readme.txt
    install -D -m644 readme.txt $pkgdir/usr/share/doc/gnp/readme.txt
    chgrp -R games $pkgdir/opt/$pkgname/replay
    chmod -R g+w $pkgdir/opt/$pkgname/replay
    chgrp -R games $pkgdir/opt/$pkgname/save
    chmod -R g+w $pkgdir/opt/$pkgname/save
    cd $srcdir
    install -m644 $pkgname.png $pkgdir/opt/$pkgname/$pkgname.png
    install -D -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

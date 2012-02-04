#Contributor: karnath <karnathtorjian@gmail.com>

pkgname=legendofyagg
pkgver=04.04.08
pkgrel=1
pkgdesc="Legend of Yagg is an old-styled Role Playing Game, It is located in a Fantasy world with, magic, monsters and mysteries"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ncurses')
url="http://sourceforge.net/projects/legendofyagg/"
source=("http://downloads.sourceforge.net/legendofyagg/yagg-dev.$pkgver.tar.bz2")
md5sums=('16774419d701dc32edc150d92ac4af10')

build() {
    cd "$srcdir/yagg-dev"
    sed -i 's/<string/&\.h/' *cpp
    make
}

package() {
    cd "$srcdir/yagg-dev"
    install -Dm 755 yagg $pkgdir/usr/bin/yagg
}


# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=jedabc
pkgver=1.18.1
pkgrel=1
pkgdesc="An extension to the Jed editor that turns it into a powerful and easy to use IDE for ABC files, with full integration with preprocessors, converters, players and previewers."
arch=(i686 x86_64)
url="http://abcplus.sourceforge.net/"
license=('gpl')
depends=('jed')
optdepends=('abc2prt')
source=(http://abcplus.sourceforge.net/abc.sl http://abcplus.sourceforge.net/jedabc.txt)
md5sums=('f4e7ea20e17d7038ca1a512fa8e5e59a'
         'd7d970eb2b5f33dc88a8be01a203ac72')

build() {

    mkdir -p $pkgdir/usr/share/jed/lib
    cp $srcdir/abc.sl $pkgdir/usr/share/jed/lib
    cp $srcdir/jedabc.txt $pkgdir/usr/share/jed/lib

}


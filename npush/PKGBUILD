# Maintainer: <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=npush
pkgver=0.7
pkgrel=4
pkgdesc="A terminal-based logic game similar to Sokoban and Boulder Dash"
arch=('i686' 'x86_64')
url="http://npush.sourceforge.net/"
license=('GPL2')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tgz npush.sh)
md5sums=('e39180c6ec228ebafb91ff2921f7bdcc'
         'abf90198f6244058f219b4ec51d05327')

build() {
    # Build
    cd $srcdir/$pkgname-$pkgver
    make || return 1
}

package() {
    # Install game data
    cd $srcdir/$pkgname-$pkgver
    install -d $pkgdir/usr/share/npush/levels
    install -m 644 levels/* $pkgdir/usr/share/npush/levels
    install -m 755 npush $pkgdir/usr/share/npush

    # Install .desktop, icon and bin
    install -Dm 644 npush.desktop $pkgdir/usr/share/applications/npush.desktop
    install -Dm 644 npush.png $pkgdir/usr/share/pixmaps/npush.png
    install -Dm 755 $srcdir/npush.sh $pkgdir/usr/bin/npush
}
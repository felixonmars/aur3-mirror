# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Jeff 'codemac' Mickey <jeff@archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=gav
pkgver=0.9.0
pkgrel=2
pkgdesc="GPL Arcade Volleyball: an SDL remake of the old dos game Arcade Volleyball"
arch=('i686' 'x86_64')
url="http://gav.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_net' 'libjpeg' 'libpng' 'zlib' 'gcc')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz 
        $pkgname.patch
        $pkgname-gcc43.patch)
md5sums=('9cafad031ab15497c4a42f1b79fb3477'
         '438a7da2b71d1584e6353f4fb09905ce'
         '3a0609791100c3c3f1613fb8a4b2d62a')

build() {
    cd $srcdir/$pkgname-$pkgver

    # Fix some incompatibilies
    patch -Np1 -i $srcdir/$pkgname.patch
    patch -Np0 -i $srcdir/$pkgname-gcc43.patch
    
    # Compile and install
    make || return 1
    install -d $pkgdir/usr/{bin,share/gav/themes}
    make ROOT=$pkgdir install || return 1
}

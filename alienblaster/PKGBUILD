#Maintainer: Simone Sclavi 'Ito' darkhado@gmail.com

pkgname=alienblaster
pkgver=1.1.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Action-loaded 2D arcade shooter game with Fedora's patches"
url="http://www.schwardtnet.de/alienblaster/"
depends=('sdl_mixer')
license=('GPL')
source=(http://www.schwardtnet.de/alienblaster/archives/alienblaster-${pkgver}.tgz
        alienblaster-1.1.0-64bit.patch
        alienblaster-1.1.0-fullscreen.patch
        alienblaster.sh
        alienblaster.desktop
        alienblaster.png)
md5sums=('27412a868f7d4ae0949036aeb29a6691'
         'd3f63bf5c8ce52ccbbd0a1ac717526e2'
         'd0ee73c60aa94c0ff66c8ce56d2ca5be'
         'd2030d826f2bdb0079701d7e2066c9c9'
         '7d29c27c883fad6c2666697b8e70f06e'
         '9c1adb2664e92fe7fc6e0b0248ba3ea6')

build() {
    cd $pkgname
    patch -Np1 -i ../alienblaster-1.1.0-64bit.patch
    patch -Np1 -i ../alienblaster-1.1.0-fullscreen.patch
    make
}

package() {
    install -Dm755 alienblaster.sh $pkgdir/usr/bin/alienblaster.sh
    
    mkdir -p $pkgdir/usr/share/{applications,pixmaps}
    install -m644 alienblaster.png $pkgdir/usr/share/pixmaps
    install -m644 alienblaster.desktop $pkgdir/usr/share/applications
    
    cd $pkgname
    install -m755 alienBlaster $pkgdir/usr/bin/alienblaster.bin
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -a images sound cfg $pkgdir/usr/share/$pkgname
}

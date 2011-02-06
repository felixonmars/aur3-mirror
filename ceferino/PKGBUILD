# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=ceferino
pkgver=0.97.8
pkgrel=3
pkgdesc="Super-Pang clone (destroy bouncing balloons with your grapnel)"
arch=('i686')
url="http://www.loosersjuegos.com.ar/juegos/ceferino"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
source=(http://www.loosersjuegos.com.ar/_media/juegos/$pkgname/descargas/$pkgname-$pkgver.tar.gz
        $pkgname-gcc44.patch
        $pkgname.desktop
        $pkgname.png)
md5sums=('aa1bc928356c1231bb79e2f3a64251fe'
         'a25ac7fce33fe53c2f647aa63cf1adcc'
         'f323c599c21517271e8bf5aff4bb78c9'
         'ca263e33cc6ce2ccced807de01fd4c5c')

build() {
    cd $srcdir/$pkgname-$pkgver
    
    # Fix gcc4.4 incompatibility
    patch -Np0 -i $srcdir/$pkgname-gcc44.patch || return 1

    # Build and install
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install || return 1

    # Install .desktop and icon
    install -Dm 644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm 644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}

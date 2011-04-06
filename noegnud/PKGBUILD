# Maintainer: Jynko <jayson at it-linux dot com>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=noegnud
pkgver=0.8.5
pkgrel=5
pkgdesc="An alternate ascii/2D/3D UI for nethack using SDL and OpenGL."
arch=('i686' 'x86_64')
url="http://www.darkarts.co.za/noegnud/about"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'mesa')
source=(http://www.darkarts.co.za/noegnud/download/$pkgname-$pkgver-full.tar.bz2
	noegnud-nethack.desktop
	noegnud-nethack.png
	noegnud-slashem.desktop
	noegnud-slashem.png)


md5sums=('54fe7879da21a96c6d31e636e9b7293f'
	 '0a29cf4e11156f4dbb5f8a67cf2f8f2c'
	 'ef2696b542ece4d4fd8b3b8e90f76197'
 	 '99c7803d521d0140a1946842d2067db1'
	 'fd1c58d23083875fa0649421dfdc180b')

build() {
    # Desktop icons
    install -Dm644 noegnud-nethack.png $pkgdir/usr/share/pixmaps/noegnud-nethack.png
    install -Dm644 noegnud-nethack.desktop $pkgdir/usr/share/applications/noegnud-nethack.desktop	
    install -Dm644 noegnud-slashem.png $pkgdir/usr/share/pixmaps/noegnud-slashem.png
    install -Dm644 noegnud-slashem.desktop $pkgdir/usr/share/applications/noegnud-slashem.desktop
        

    cd $srcdir/$pkgname-$pkgver
    make INSTALLDIR=$pkgdir/usr home

    # Fix permissions
    chgrp -R games $pkgdir/usr/lib/noegnud

    # Fix broken bins
    sed -i 's|^HACKDIR=.*|HACKDIR=/usr/lib/noegnud/nethack|' \
        $pkgdir/usr/bin/noegnud-nethack
    sed -i 's|^HACKDIR=.*|HACKDIR=/usr/lib/noegnud/slashem|' \
            $pkgdir/usr/bin/noegnud-slashem
}

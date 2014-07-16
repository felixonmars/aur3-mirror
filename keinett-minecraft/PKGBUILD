# Maintainer: ItachiSan - Giovanni Santini <giovannisantini93@yahoo.it>
# Credits to AnjoCaido0, Sparamoule and KeiNett for the launcher file.
# Based on initial MinecraftSP package by Xewl - Ken Verhaegen <xewl@live.com>

pkgname=keinett-minecraft
#epoch=1
pkgver=1
pkgrel=404.1
pkgdesc="Allows singleplayer and multiplayer mode. Minecraft is a sandbox game which allows players to build constructions out of textured cubes in a 3D world."
arch=(any)
license=('custom')
url="http://keinett.com/"
depends=('java-runtime' 'xorg-xrandr' 'openal')
provides=('minecraft')
source=('keinett'
        'http://k31.us/v1404sortanew'
        'keinett.desktop'
        'keinett.png'
        'LICENSE.txt')
md5sums=('a3514c9c0cf898423d3a3f9297b8ec0b'
         'bf0ad4e14bbd228bace5b32eb8287356'
         '92a7154ba840efa952716987afb34715'
         '29f4f5c8da599571d060adac01249e59'
         '487f204c98bf0be5d774eb0694c2b24c')
install=keinett.install

package() {
    mkdir -p $pkgdir/usr/bin
    cp keinett $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/keinett
    cp "$srcdir/Mac OS & Linux/KN Launcher v1.404.jar"  $pkgdir/usr/share/keinett/KeiNett.jar #Already extracted

    # Desktop launcher with icon
    install -Dm644 $srcdir/keinett.desktop              $pkgdir/usr/share/applications/keinett.desktop
    install -Dm644 $srcdir/keinett.png                  $pkgdir/usr/share/pixmaps/keinett.png

    # Readme
    install -Dm644 $srcdir/"THE DONT READ ME FILE".txt  $pkgdir/usr/share/keinett/readme.txt
    install -Dm644 $srcdir/Changelog.txt                $pkgdir/usr/share/keinett/changelog.txt
    install -Dm644 $srcdir/LICENSE.txt                  $pkgdir/usr/share/keinett/LICENSE.txt
}

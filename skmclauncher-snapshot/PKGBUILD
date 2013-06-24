# Maintainer: Clayton Holloway <clayton.holloway@gmail.com>

pkgname=skmclauncher-snapshot
_pkgname=skmclauncher
pkgver=latest
_pkgver=${pkgver}-SNAPSHOT
pkgrel=1
pkgdesc="sk89q's Minecraft launcher - Easily install mods, update MC, open source"
arch=(any)
license=('LGPL3')
url="https://github.com/sk89q/skmclauncher"
depends=('java-runtime' 'xorg-server-utils' 'openal')
makedepends=('wget')

source=('skmc' 'skmc.desktop' 'icon.png' 'http://maven.sk89q.com/repo/com/sk89q/mclauncher/3.2-SNAPSHOT/mclauncher-3.2-SNAPSHOT.jar')
_md5=$(wget -qO- http://maven.sk89q.com/repo/com/sk89q/mclauncher/3.2-SNAPSHOT/mclauncher-3.2-SNAPSHOT.jar.md5 | awk -F' ' ' "'"mclauncher-3.2-SNAPSHOT.jar.md5"'" { print $1 }')
md5sums=('3899951f27410ca13184fd1298971036'
         '0e8958712cd43875c003b5158e99a5bb'
         '585022e0efc7e2bc5b7f22f6c8192660'
         ${_md5})

build() {
    cd "$srcdir" || return 1
    
    install -D -m755 "${srcdir}/skmc"         "${pkgdir}/usr/bin/skmc"
    install -D -m644 "${srcdir}/mclauncher-3.2-SNAPSHOT.jar"     "${pkgdir}/usr/share/minecraft/skmc.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/skmc.desktop" "${pkgdir}/usr/share/applications/skmc.desktop"
    install -D -m644 "${srcdir}/icon.png"     "${pkgdir}/usr/share/pixmaps/skmc.png"
}

# vim:set ts=4 sw=4 et:

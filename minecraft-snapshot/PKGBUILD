# Maintainer: Cilyan Olowen <gaknar@gmail.com>
# Maintainer: Christophe Robin <crobin@php.net>

pkgname=minecraft-snapshot
pkgver=latest
pkgrel=2
pkgdesc="Minecraft is a game about placing blocks while running from skeletons. Or something like that... (Snapshot version)"
arch=(any)
license=('custom')
url="http://www.minecraft.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=('MinecraftDev.jar')
source=(minecraft-snapshot http://s3.amazonaws.com/Minecraft.Download/launcher/MinecraftDev.jar
         minecraft-snapshot.desktop minecraft-snapshot.png minecraft-snapshot.install)
md5sums=('4a5234326cd7d6c136b2ba0110d7752d'
         '81e1e68bfc4e8c261958414614eaffb9'
         '255c4fd483446f8dc999d9806c453c6c'
         'b2c25797bf513a5ee215dd90b4b828e3'
         '30f8fd3deb598757bb21bac3c1c55110')
install='minecraft-snapshot.install'

package() {
    cd "$srcdir"

    install -D -m755 "${srcdir}/minecraft-snapshot"         "${pkgdir}/usr/bin/minecraft-snapshot"
    install -D -m644 "${srcdir}/MinecraftDev.jar"     "${pkgdir}/usr/share/minecraft/MinecraftDev.jar"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/minecraft-snapshot.desktop" "${pkgdir}/usr/share/applications/minecraft-snapshot.desktop"
    install -D -m644 "${srcdir}/minecraft-snapshot.png"     "${pkgdir}/usr/share/pixmaps/minecraft-snapshot.png"
}

# vim:set ts=4 sw=4 et:

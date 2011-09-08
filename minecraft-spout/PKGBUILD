# Maintainer: Zach Jaggi <feilen@fluffybutt.in>

pkgname=minecraft-spout
pkgver=latest
pkgrel=1
pkgdesc="Minecraft, with a modified command to automatically include 'Spout' mod. (includes Optifine)"
arch=(any)
license=('custom')
conflicts=('minecraft')
url="http://www.minecraft.net/"
depends=('java-runtime' 'xorg-server-utils' 'openal')
source=(minecraft http://www.minecraft.net/download/minecraft.jar 
         minecraft.desktop minecraft.png minecraft.install http://ci.getspout.org/job/Spoutcraft/Recommended/artifact/target/spoutcraft-dev-SNAPSHOT-MC-1.7.3.zip)
md5sums=('8ceafc3b9f00bdfebf410e76ecc17ebd'
         '6e053e85cd4920f7aaf26c4455b50ce7'
         'dad9b69540dac246ced70b98f07e8e08'
         'b2c25797bf513a5ee215dd90b4b828e3'
         'e1d5b731652eb5d5fa1fdd81a92df8a0'
	 'cbcae2204e1920ca22ec52c632f86987')
install='minecraft.install'

build() {
    cd "$srcdir" || return 1

    install -D -m755 "${srcdir}/minecraft"         			"${pkgdir}/usr/bin/minecraft"
    install -D -m644 "${srcdir}/minecraft.jar"     			"${pkgdir}/usr/share/minecraft/minecraft.jar"
    install -D -m644 "${srcdir}/spoutcraft-dev-SNAPSHOT-MC-1.7.3.zip"	"${pkgdir}/usr/share/minecraft/spoutcraft.zip"

    # Desktop launcher with icon
    install -D -m644 "${srcdir}/minecraft.desktop" "${pkgdir}/usr/share/applications/minecraft.desktop"
    install -D -m644 "${srcdir}/minecraft.png"     "${pkgdir}/usr/share/pixmaps/minecraft.png"
}

# vim:set ts=4 sw=4 et:

# Maintainer: flycoder.aur <flycoder.aur@gmail.com>

pkgname=weepcraft
pkgver=6.8
pkgrel=14
pkgdesc="A modified minecraft client for hacking."
arch=(any)
url="http://weepforums.com/"
license=('unknown')
depends=('java-runtime' 'openal' 'xorg-server-utils')
optdepends=('minecraft: for the vanilla launcher' 'magiclauncher: for an alternative launcher')
install=weepcraft.install
source=(WeepCraft.jar::https://copy.com/CS73WQO2ujot/6.8.jar?download=1  WeepCraft.json)
noextract=('WeepCraft.jar')
md5sums=('f729c9f63936d77a737f4c70ab91186e' '6f7cd373062b0b5aa70041309a27b435')

package() {
	install -Ddm755 --owner=$USER $pkgdir/home/$USER/.minecraft/versions/WeepCraft/
        install -Dm755 --owner=$USER $srcdir/WeepCraft.jar $pkgdir/home/$USER/.minecraft/versions/WeepCraft/WeepCraft.jar
        install -Dm644 --owner=$USER $srcdir/WeepCraft.json $pkgdir/home/$USER/.minecraft/versions/WeepCraft/WeepCraft.json
}

# Maintainer: Archimaredes <microphonics17@gmail.com>

pkgname=technic-launcher
pkgver=431
pkgrel=1
pkgdesc="The Technic Platform's launcher, which allows you to install and play dozens of Technic modpacks for Minecraft, including Tekkit, Voltz, and Hexxit."
arch=(any)
url=http://www.technicpack.net/download
license=("custom:SpoutDev License Version 1")
depends=(java-environment sh openal)
provides=(tekkit minecraft-technic-launcher)
conflicts=(tekkit minecraft-technic-launcher)
noextract=(TechnicLauncher.jar)
install=technic-launcher.install

source=(LICENSE
	technic-launcher
	technic-launcher.desktop
	technic-launcher.png
        http://launcher.technicpack.net/launcher/$pkgver/TechnicLauncher.jar)

md5sums=(85ea09d79159ceb40be140bfc96e1d56
         7fe2e599ef16b05b2c0460f48e3b5e11
         148c9f38ec26536cf18808094d7bef8b
         ec7bc60d6fe16905b8438828ce42a3c8
         00665f2f6105ae5d0f5d36f371fcb45f)

package() {
    install -D -m 644 "${srcdir}/LICENSE"		    "${pkgdir}/usr/share/licenses/technic-launcher/LICENSE"
    install -D -m 755 "${srcdir}/technic-launcher"	    "${pkgdir}/usr/bin/technic-launcher"
    install -D -m 644 "${srcdir}/technic-launcher.desktop"  "${pkgdir}/usr/share/applications/technic-launcher.desktop"
    install -D -m 644 "${srcdir}/technic-launcher.png"	    "${pkgdir}/usr/share/pixmaps/technic-launcher.png"
    install -D -m 644 "${srcdir}/TechnicLauncher.jar"	    "${pkgdir}/usr/share/technic-launcher/TechnicLauncher.jar"
}

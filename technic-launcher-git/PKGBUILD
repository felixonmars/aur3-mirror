# Maintainer: Crawln45 <crawl45@gmail.com>
# Forked from : Archimaredes <microphonics17@gmail.com>

pkgname=technic-launcher-git
pkgver=383
pkgrel=1
pkgdesc="The Technic Platform's launcher, which allows you to install and play dozens of Technic modpacks for Minecraft, including Tekkit, Voltz, and Hexxit."
arch=(any)
url=http://www.technicpack.net/download
license=("custom:SpoutDev License Version 1")
depends=("java-environment" "sh" "openal")
provides=(tekkit minecraft-technic-launcher)
conflicts=(tekkit minecraft-technic-launcher)
noextract=(TechnicLauncher.jar)

source=("$pkgname"::"git://github.com/crawln45/technic-launcher-arch.git")

md5sums=("SKIP")
pkgver () {
	curl -s http://build.technicpack.net/job/TechnicLauncher/lastSuccessfulBuild/buildNumber | grep -Eo "[0-9]{0,3}"
}
package() {
	cd "$srcdir/$pkgname"
	rm README.md
    install -D -m 644 "${srcdir}/${pkgname}/LICENSE"		    "${pkgdir}/usr/share/licenses/technic-launcher/LICENSE"
    install -D -m 755 "${srcdir}/${pkgname}/technic-launcher"	    "${pkgdir}/usr/bin/technic-launcher"
    install -D -m 644 "${srcdir}/${pkgname}/technic-launcher.desktop"  "${pkgdir}/usr/share/applications/technic-launcher.desktop"
    curl --output ${srcdir}/${pkgname}/TechnicLauncher.jar http://mirror.technicpack.net/launcher/$pkgver/TechnicLauncher.jar
    install -D -m 644 "${srcdir}/${pkgname}/technic-launcher.png"	    "${pkgdir}/usr/share/pixmaps/technic-launcher.png"
    install -D -m 644 "${srcdir}/${pkgname}/TechnicLauncher.jar"	    "${pkgdir}/usr/share/technic-launcher/TechnicLauncher.jar"
}

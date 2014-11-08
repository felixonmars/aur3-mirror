#Maintainer: Kaleb Klein <klein.jae@gmail.com>

pkgname=minecraft-server-lite
pkgver=1.8
pkgrel=2
pkgdesc="Lightweight server tool for hosting Minecraft servers. Comes with server jar and couple files to run, no needed extra bloatware."
arch=(any)
license=('GPL' 'custom:Mojang EULA')
url="http://www.minecraft.net"
depends=('java-runtime')
optdepends=('ttf-dejavu: GUI Makes use of DejaVu. Just looks nicer with it.')
noextract=('minecraft_server.${pkgver}.jar')
source=(mcserver https://s3.amazonaws.com/Minecraft.Download/versions/${pkgver}/minecraft_server.${pkgver}.jar
		mcserver.desktop mcserver.png mcserver.install LICENSE)
sha256sums=('897687375889f57e2ea6d45abc8f0d6d7a3e78022dcdc71ac1589d3e0450ddc3'
            '40e23f3823d6f0e3cbadc491cedb55b8ba53f8ab516b68182ddd1536babeb291'
            'd9794c4b9308cced22a33b2dc1c2586c0e6ac0d3f8caa6b17d30b14bd1e1a6da'
            '037d7d3572231d8beae2cba8d61d46a7162ff21947817042e2775b8bc5c10a3d'
            '2de925aa451a01f74c513dc448785df20d1f33a69a88b6141e1485857a70bb65'
            '5c551c5baea99bf6b00e4f8bb5850f9da5383d799583ea331595af12f766a999')
install='mcserver.install'

package() {
	cd "$srcdir"

	install -D -m755 "${srcdir}/mcserver" "${pkgdir}/usr/bin/mcserver"
	install -D -m644 "${srcdir}/minecraft_server.${pkgver}.jar" "${pkgdir}/usr/share/minecraft-server/minecraft_server.jar"

	# Desktop launcher
	install -D -m644 "${srcdir}/mcserver.desktop" "${pkgdir}/usr/share/applications/mcserver.desktop"
	install -D -m644 "${srcdir}/mcserver.png" "${pkgdir}/usr/share/pixmaps/mcserver.png"

	# License
	install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/minecraft-server/LICENSE"
}

# vim:set ts=4 sw=4 et:

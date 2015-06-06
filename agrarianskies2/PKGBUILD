# Maintainer: Christoph Stahl <christoph.stahl@uni-dortmund.de>

pkgname=agrarianskies2
pkgver=1.1.5
pkgrel=1
pkgdesc="Minecraft Modpack server: Agrarian Skies 2"
arch=(any)
url="http://minecraft.curseforge.com/modpacks/225550-agrarian-skies-2"
license=("custom")
depends=('java-runtime-headless'
         'tmux'
         'sudo')
install='agrarianskies2.install'
source=("AS2-${pkgver}.zip::http://minecraft.curseforge.com/modpacks/225550-agrarian-skies-2/files/2241072/download"
	'agrarianskies2.service'
	'agrarianskies2.sh')

package() {
	mkdir -p "${pkgdir}/srv/agrarianskies2/"
	cp -r "${srcdir}"/config "${pkgdir}"/srv/agrarianskies2/
	cp -r "${srcdir}"/libraries "${pkgdir}"/srv/agrarianskies2/
	cp -r "${srcdir}"/mods "${pkgdir}"/srv/agrarianskies2/
	install -m644 "${srcdir}"/forge* "${pkgdir}/srv/agrarianskies2/"
	install -m644 "${srcdir}/minecraft_server"* "${pkgdir}/srv/agrarianskies2/"
	cd "${pkgdir}/srv/agrarianskies2/"
	ln -s forge* agrarianskies2.jar
	install -m755 "${srcdir}/agrarianskies2.sh" "${pkgdir}/srv/agrarianskies2/"
	install -Dm644 "${srcdir}/agrarianskies2.service" "${pkgdir}/usr/lib/systemd/system/agrarianskies2.service"


}
md5sums=('dd052b52aa76fa0378f2ab9796b2ef52'
         'feb9f2279d8cdd6bb4eab0b0213f9992'
         '750edbd537e2ff886f6332425da269c2')

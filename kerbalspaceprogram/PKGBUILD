# Maintainer: J0k3r <moebius282 e4at gmail D0_T com>

pkgname=kerbalspaceprogram
pkgver=0.21.1
pkgrel=1
pkgdesc="A multi-genre game where the players create their own space program."
url="https://kerbalspaceprogram.com/"
license=('unknown')
arch=('i686' 'x86_64')
groups=("games")
depends=('gcc-libs' 'libgl' 'glu' 'libxcursor')
makedepends=('unzip')
# install="${pkgname}.install"
_purgefiles=('KSP.exe')		
_archivename="ksp-linux-${pkgver//./-}"
source=(	"file://${_archivename}.zip"
			"${pkgname}.desktop")
			# "${pkgname}.install")
sha256sums=('e4f4ff9bf95efa39510a636eb340845480ef2db3a9e916a9f21428d3d152baa7'
			'7e07495b0c738c71932e9f3d28abdad9168986384fb855bf932dfb604e2988cd')
			# 'c6ba824f73917be27af3fa1d0e57ef1651d70e7a0473a98a02dae3df05e2e625')
PKGEXT=".pkg.tar"

DLAGENTS+=('file::/usr/bin/echo "Could not find file \"%u\" "')


package()
{
	install -d "${pkgdir}/opt/"

# took me ~2h to know what has to have which permissions..
	cp -r "${srcdir}/KSP_linux/" "${pkgdir}/opt/${pkgname}"

	cd "${pkgdir}/opt/${pkgname}"

	install -d -m777 "Screenshots/" "Plugins/" "PluginData/"
	chmod -R 0777 "saves/"
	
	touch "settings.cfg" "KSP.log"
	chmod o+w "settings.cfg" "KSP.log"

# I don't know if i should cry or laugh..
# For the ASSETS! directory; needs executable and write on all files!?
# Fun Fact: It doesn't even write to it.
	chmod -R 0777 "GameData/"

# TODO: add more unneeded files and remove the bundled mono
	for i in "${_purgefiles[@]}"; do
		echo "Removing unneeded file: $i"; rm "$i"
	done

	install -d "${pkgdir}/usr/bin/"

	if [[ "$CARCH" == "x86_64" ]]; then
		ln -s "/opt/${pkgname}/KSP.x86_64" "${pkgdir}/usr/bin/${pkgname}"
	else
		ln -s "/opt/${pkgname}/KSP.x86" "${pkgdir}/usr/bin/${pkgname}"
	fi


	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	# install -D -m644 "${pkgdir}/opt/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
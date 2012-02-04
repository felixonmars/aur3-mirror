# Gizmo5: Installer: Arch
# Contributor: Chris Giles <Chris.G.27 (at) Gmail.com>

shortname=gizmo
pkgname=${shortname}5
oldname=${shortname}-project
pkgver=3.1.0.79
pkgrel=1
libname=libsipphoneapi
libver=1.7.07.73
pkgdesc="A free VoIP phone for your computer that makes calling as easy as instant messenging"
arch=("i686")
url="http://${pkgname}.com/"
license=("custom")
depends=("gcc-libs" "alsa-lib" "gconf" "libxss" "expat" "pango" "orbit2")
conflicts=("${shortname}")
replaces=("${shortname}")
options=(!emptydirs)

source=(http://download.${pkgname}.com/GizmoDownload/${oldname}-${pkgver}-1-libstdc++6.tar.gz)
sha1sums=('e7f0c172d3870f1146d685af047743ad4e64e960')

build() {
	cd ${srcdir}/${oldname}-${pkgver}

	# Directories
	install -d ${pkgdir}/usr/share/${libname}/

	# Application
	cp -r share/ ${pkgdir}/usr/

	# Libraries
	install -D -m 755 ${libname}.so.${libver} ${pkgdir}/usr/lib/${libname}.so.${libver}

	# Binaries
	install -D -m 755 ${shortname} ${pkgdir}/usr/bin/${shortname}

	# License
	install -D EULA.rtf ${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf || return 1

	# Desktop
	install -D ${startdir}/extra/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D share/${shortname}/pixmaps/icons/${shortname}-icon-48.png ${pkgdir}/usr/share/pixmaps/${shortname}-icon-48.png
	#install -D share/${shortname}/pixmaps/${shortname}/regular/${shortname}-logo.png ${pkgdir}/usr/share/pixmaps/
	install -D share/${shortname}/sounds/*.wav ${pkgdir}/usr/share/${libname}/
}

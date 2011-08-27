# Gizmo5: Installer: Arch
# Contributor: John Regan <saxindustries (at) Gmail.com>
# Adopted from gizmo5 package by Chris.Giles

shortname=gizmo
pkgname=bin32-${shortname}5
oldname=${shortname}-project
wrapper=gizmo32_wrapper
pkgver=3.1.0.79
pkgrel=1
libname=libsipphoneapi
libver=1.7.07.73
pkgdesc="A free VoIP phone for your computer that makes calling as easy as instant messenging"
arch=("x86_64")
url="http://${shortname}5.com/"
license=("custom")
depends=("lib32-gvfs" "lib32-libcanberra" "lib32-dbus-glib" "lib32-libxdamage" "lib32-gtk2" "lib32-gcc-libs" "lib32-alsa-lib" "lib32-gconf" "lib32-libxss" "lib32-expat" "lib32-pango" "lib32-orbit2")
conflicts=("${shortname}")
replaces=("${shortname}")
options=(!emptydirs)

source=(http://download.${shortname}5.com/GizmoDownload/${oldname}-${pkgver}-1-libstdc++6.tar.gz)
sha1sums=('e7f0c172d3870f1146d685af047743ad4e64e960')

build() {
	cd ${srcdir}/${oldname}-${pkgver}

	# Directories
	install -d ${pkgdir}/usr/share/${libname}/

	# Application
	cp -r share/ ${pkgdir}/usr/

	# Libraries
	install -D -m 755 ${libname}.so.${libver} ${pkgdir}/opt/lib32/usr/lib/${libname}.so.${libver}

	# Binaries
	install -D -m 755 ${shortname} ${pkgdir}/usr/bin/${shortname}
	install -D -m 755 ${startdir}/extra/${wrapper} ${pkgdir}/usr/bin/${wrapper}

	# License
	install -D EULA.rtf ${pkgdir}/usr/share/licenses/${shortname}5/EULA.rtf || return 1

	# Desktop
	install -D ${startdir}/extra/${shortname}5.desktop ${pkgdir}/usr/share/applications/${shortname}5.desktop
	install -D share/${shortname}/pixmaps/icons/${shortname}-icon-48.png ${pkgdir}/usr/share/pixmaps/${shortname}-icon-48.png
	#install -D share/${shortname}/pixmaps/${shortname}/regular/${shortname}-logo.png ${pkgdir}/usr/share/pixmaps/
	install -D share/${shortname}/sounds/*.wav ${pkgdir}/usr/share/${libname}/
}

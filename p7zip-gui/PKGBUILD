# P7Zip-GUI: Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

realname=p7zip
pkgname=${realname}-gui
pkgver=9.20
pkgrel=1
pkgdesc="The GUI component of the P7Zip compression utility"
arch=("i686" "x86_64")
license=("GPL")
url="http://${realname}.sourceforge.net"
depends=("wxgtk" "${realname}=${pkgver}")
makedepends=("make" "yasm")
optdepends=("j7z: An alternative 7-Zip GUI")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/${realname}/${realname}_${pkgver}_src_all.tar.bz2)

build() {
	cd "${srcdir}"/${realname}_${pkgver}

	[[ $CARCH = x86_64 ]] \
	&& cp makefile.linux_amd64_asm makefile.machine \
	|| cp makefile.linux_x86_asm_gcc_4.X makefile.machine
	sed -i "s|usr/local|usr|g" makefile

	make 7zG 7zFM OPTFLAGS="${CXXFLAGS}"
}

package() {
	cd "${srcdir}"/${realname}_${pkgver}

	install -m755 -D bin/7zG "${pkgdir}"/usr/lib/${realname}/7zG
	install -m755 -D bin/7zFM "${pkgdir}"/usr/lib/${realname}/7zFM

	install -d "${pkgdir}"/usr/bin/
	cp "${startdir}"/7z{FM,G} "${pkgdir}"/usr/bin/

	install -m755 -D GUI/${realname}ForFilemanager "${pkgdir}"/usr/bin/${realname}ForFilemanager
	install -m755 -D GUI/${realname}_32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/${realname}.png
	ln -s /usr/lib/${realname}/7zCon.sfx "${pkgdir}"/usr/lib/${realname}/7z.sfx

	# Desktop
	install -d "${pkgdir}"/usr/share/applications/
	cp "${startdir}"/7zFM.desktop "${pkgdir}"/usr/share/applications/

	# KDE
	install -d "${pkgdir}"/usr/share/kde4/services/ServiceMenus/
	cp GUI/kde4/* "${pkgdir}"/usr/share/kde4/services/ServiceMenus/

	# Language
	find "GUI/Lang" -type d -exec chmod 755 {} ';'
	find "GUI/Lang" -type f -exec chmod 644 {} ';'
	cp -r GUI/Lang "${pkgdir}"/usr/lib/${realname}/

	# Help
	find "GUI/help" -type d -exec chmod 755 {} ';'
	find "GUI/help" -type f -exec chmod 644 {} ';'
	cp -r GUI/help "${pkgdir}"/usr/lib/${realname}/
}

sha1sums=('c976df4543ea946a65bc3f5e3d4e9baa417e5f12')

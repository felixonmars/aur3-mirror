# P7Zip-GUI: Installer: Arch
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

realname=p7zip
pkgname=${realname}-gui
pkgver=9.13
pkgrel=1
pkgdesc="The GUI component of the P7Zip compression utility"
arch=("i686" "x86_64")
license=("GPL")
url="http://${realname}.sourceforge.net"
depends=("wxgtk" "${realname}=${pkgver}")
makedepends=("make")
optdepends=("q7z: A P7Zip GUI, which attempts to simplify data compression and backup")
options=(!emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/${realname}/${realname}_${pkgver}_src_all.tar.bz2)

build() {
	cd ${srcdir}/${realname}_${pkgver}

	#Arch64 fix
	if [ "${CARCH}" == "x86_64" ]; then
		cp makefile.linux_amd64 makefile.machine
	else
		cp makefile.linux_x86_ppc_alpha_gcc_4.X makefile.machine
	fi

	sed -i "s|usr/local|usr|g" makefile || return 1

	# Build
	make 7zG OPTFLAGS="${CXXFLAGS}" || return 1
	make install DEST_HOME="${pkgdir}/usr" \
	DEST_MAN="${pkgdir}/usr/share/man" \
	DEST_SHARE_DOC="http://www.bugaco.com/7zip" || return 1

	# Install
	install -m755 -D bin/7zG ${pkgdir}/usr/lib/${realname}/7zG
	install -m755 -D ${startdir}/extra/7zG ${pkgdir}/usr/bin/7zG
	#install -m755 -D ${pkgdir}/usr/bin/7z ${pkgdir}/usr/bin/7zG
	#sed -i "s|/7z|/7zG|g" ${pkgdir}/usr/bin/7zG || return 1
	#ln -s /usr/lib/${realname}/7zG ${pkgdir}/usr/bin/7zG
	install -m755 -D GUI/${realname}ForFilemanager ${pkgdir}/usr/bin/${realname}ForFilemanager
	install -m755 -D GUI/${realname}_16_ok.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${realname}.png
	ln -s /usr/lib/${realname}/7zCon.sfx ${pkgdir}/usr/lib/${realname}/7z.sfx

	# Remove
	rm -r ${pkgdir}/usr/share/man/
}

sha1sums=('81da0729561ce123c0a82656ec96a04ad5bfa522')

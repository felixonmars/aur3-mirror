# Maintainer: Jesus Lazaro Plaza <jesuslazaro84 at gmail dot com>
# Based on Penguin's one: 'google-earth' (i686 only)


_use_arch_libs="no" # Change to "yes" if you want to use provided-by-Arch libraries instead of provided-by-Google ones.

pkgname=bin32-google-earth
_pkgname=google-earth
pkgver=6.0.3.2197
pkgrel=1
pkgdesc="32 bits binaries of google-earth for Arch64"
url="http://earth.google.com"
license=('custom')
depends=('lib32-libsm' 'lib32-libxrandr' 'lib32-libgl' 'lib32-glib2' 'lib32-libxi' 'lib32-pcre' 'lib32-fontconfig' 'lib32-libxdamage' 'lib32-qt' 'lib32-mesa' 'lib32-curl' 'lib32-sqlite3' 'ld-lsb')
optdepends=('ttf-bitstream-vera: Fonts'
            'lib32-nss-mdns: In case the application fails to contact the servers'
            'lib32-libgtk2: SCIM support'
	    'lib32-nvidia-utils: For using Google Earth with nvidia graphics driver'
	    'lib32-catalyst-utils: For using Google Earth with Ati catalyst graphics driver'
            'lib32-intel-dri: For using Google Earth with intel graphics driver'
	    'lib32-ati-dri: For using Gogle Earth with ati graphics driver')
conflicts=('google-earth')
install=google-earth.install
source=(http://dl.google.com/earth/client/current/GoogleEarthLinux.bin
	http://earth.google.com/intl/en/license.html
	googleearth
	googleearth.desktop
	googleearth-mimetypes.xml
	qt.conf
	pangorc)
arch=('x86_64')
md5sums=('6808153226b99f21a66f5f615fcf7051'
         '757d9726191f365209fa13acdd0ab6e7'
         '4dee705ee4221051e0fefd4df01b4581'
         'be7209d3edb3df110946acf5e0cd0db3'
         '84e1efd656f86c52333cc629b31accb0'
	 '335088571a7182988280643c61e0230e'
	 'bd9f74c28489eb79f31e84977e3cf305')
_libs_to_remove="libcurl.so.4 libGLU.so.1 libQtCore.so.4 libQtGui.so.4 libQtNetwork.so.4 libQtWebKit.so.4"
[ "${_use_arch_libs}" == "no" ] && depends=('lib32-libsm' 'lib32-libxrandr' 'lib32-libgl' 'lib32-glib2' 'lib32-libxi' 'lib32-pcre' 'lib32-fontconfig' 'lib32-libxdamage' 'ld-lsb')

build() {
	cd ${srcdir}

	# Extract archive
	sh ./GoogleEarthLinux.bin --noexec --target ${srcdir}/${_pkgname} || return 1
}

package() {
	# Install binaries and data files
	mkdir -p ${pkgdir}/opt/${_pkgname}
	tar -xpf ${srcdir}/${_pkgname}/googleearth-linux-x86.tar -C ${pkgdir}/opt/${_pkgname}/ || return 1
	tar -xpf ${srcdir}/${_pkgname}/googleearth-data.tar -C ${pkgdir}/opt/${_pkgname}/ || return 1

	# Install executable
	install -D -m755 ${srcdir}/googleearth ${pkgdir}/usr/bin/googleearth || return 1

	# Install .desktop file
	install -D -m644 ${srcdir}/googleearth.desktop ${pkgdir}/usr/share/applications/googleearth.desktop || return 1

	# Install shared MIME info package
	install -D -m644 ${srcdir}/googleearth-mimetypes.xml ${pkgdir}/usr/share/mime/packages/googleearth-mimetypes.xml || return 1

	# Install icon
	install -D -m644 ${srcdir}/${_pkgname}/googleearth-icon.png ${pkgdir}/usr/share/pixmaps/googleearth-icon.png || return 1
	
	# Install license
	install -D -m644 ${srcdir}/license.html ${pkgdir}/usr/share/licenses/${_pkgname}/license.html || return 1

	# Install pango config file
	install -D -m644 ${srcdir}/pangorc ${pkgdir}/opt/${_pkgname}/pangorc || return 1

	# Removing provided libraries to use Arch ones (only if _use_arch_libs is set to "yes")
	if [ "${_use_arch_libs}" == "yes" ]; then
		cd ${pkgdir}/opt/${_pkgname} || return 1
		rm ${_libs_to_remove} || return 1
		install -D -m644 ${srcdir}/qt.conf ${pkgdir}/opt/${_pkgname}/qt.conf
	fi

	# Change ownership to root
        chown -R root:root ${pkgdir}/* || return 1
}

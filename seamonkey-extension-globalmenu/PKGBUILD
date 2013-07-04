# Maintainer: superlex

# Based on firefox-extension-globalmenu 
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>
# Thank you so much to teekay


pkgname=seamonkey-extension-globalmenu
pkgver=4.1.bzr529
_seaver=2.19
_xulver=22.0
pkgrel=2
pkgdesc="Global dbusmenu/appmenu extension for Seamonkey (unofficial)"
url="https://launchpad.net/globalmenu-extension"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libdbusmenu' 'libdbusmenu-gtk2' "seamonkey>=${_seaver}")
makedepends=('bzr' 'autoconf2.13' 'python2' 'yasm' 'zip' 'unzip' "xulrunner>=${_xulver}" 'libidl2')
options=()
conflicts=()
replaces=()
install=
source=('bzr+lp:globalmenu-extension'
	'disable_webgl.patch'
	'disable_xpcom_linking.patch'
	'seamonkey_compat.patch')
md5sums=('SKIP'
         '630639b4d8e3f99fe48428249452b8f0'
         '69cce35c37379d1377510e1c3d0b0def'
         '69533d3d8a08e626cb69b72d6d3ec161')

_bzrroot=lp:globalmenu-extension
_bzrname=globalmenu-extension

pkgver() {
	cd ${_bzrname}
	echo "$(sed -n 's/.*<em:version>\([^ ]*\)<\/em:version>/\1/p' extensions/globalmenu/package/install.rdf).bzr$(bzr revno)"
}

build() {
	cd "$srcdir/${_bzrname}"

	patch -p0 < "${srcdir}/disable_webgl.patch"
	patch -p0 < "${srcdir}/disable_xpcom_linking.patch"
	sed -i -e 's@maxVersion>21@maxVersion>22@g' extensions/globalmenu/package/install.rdf
	
        # Add seamonkey section to install.rdf 
	patch -Np1 -i "${srcdir}/seamonkey_compat.patch"

	autoconf-2.13
	sed -i 's/^ \t/\t/g' config/rules.mk
	sed -i '/^XPIDL_COMPILE[[:space:]]*=/s@\$(LIBXUL_DIST)/@&sdk/@' config/config.mk

	export CPPFLAGS="${CPPFLAGS} -O2"
	
	./configure --with-libxul-sdk=`pkg-config --variable=sdkdir libxul` \
		--with-system-libxul \
		--with-system-nspr \
		--with-system-nss \
		--enable-application=extensions \
		--enable-extensions=globalmenu \
		--disable-tests \
		--disable-necko-wifi \
		--disable-crashreporter \
		--disable-ogg \
		--disable-alsa \
		--disable-webgl \
		--disable-webm \
		--disable-webrtc \
		--disable-dash
	make || return 1
}

package() {
	cd "$srcdir/${_bzrname}"
	emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' dist/xpi-stage/globalmenu/install.rdf)
	install -d "${pkgdir}/usr/lib/seamonkey-$_seaver/extensions/${emid}"
	unzip -d "${pkgdir}/usr/lib/seamonkey-$_seaver/extensions/${emid}" dist/xpi-stage/globalmenu.xpi
}

# vim:syntax=sh

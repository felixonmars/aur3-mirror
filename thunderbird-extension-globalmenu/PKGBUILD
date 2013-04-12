# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=thunderbird-extension-globalmenu
pkgver=20130411
pkgrel=1
pkgdesc="Global dbusmenu/appmenu extension for Thunderbird"
url="https://launchpad.net/globalmenu-extension"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libdbusmenu' 'libdbusmenu-gtk2' 'thunderbird')
makedepends=('bzr' 'autoconf2.13' 'python2' 'yasm' 'zip' 'unzip' 'xulrunner' 'libidl2')

_xul_ver=17.0.1

source=("http://arm.konnichi.com/2013/01/08/extra/os/${CARCH}/xulrunner-${_xul_ver}-1-${CARCH}.pkg.tar.xz"
        "disable_webgl.patch")
_xul_md5="3563469bf8c968034c568e7c0b105720"
[[ "${CARCH}" = "i686" ]] && _xul_md5="9650e97757a27e820fa3a32b1bcadbd2"
md5sums=("${_xul_md5}"
	 "58fe237371a87a144ac7193e10dd61be")

# _bzrroot=lp:globalmenu-extension
_bzrroot=lp:~extension-hackers/globalmenu-extension/3.6
_bzrname=globalmenu-extension

build() {
	cd "$srcdir"
	msg "Connecting to BZR server...."

	if [ -d $_bzrname ] ; then
		cd $_bzrname && bzr update
		msg "The local files are updated."
	else
		bzr branch $_bzrroot $_bzrname
	fi
	msg "BZR checkout done"

	msg "Starting make..."
	rm -rf "$srcdir/${_bzrname}-build"
	cp -r "$srcdir/${_bzrname}" "$srcdir/${_bzrname}-build"

	cd "${srcdir}/usr/lib/xulrunner-devel-${_xul_ver}"
	ln -sf ../xulrunner-${_xul_ver} bin
	ln -sf ../../share/idl/xulrunner-${_xul_ver} idl
	ln -sf ../../include/xulrunner-${_xul_ver} include
	ln -sf sdk/lib lib

	cd "$srcdir/${_bzrname}-build"

	patch -p0 < "${srcdir}/disable_webgl.patch"

	autoconf-2.13
	sed -i 's/^ \t/\t/g' config/rules.mk
	sed -i '/^XPIDL_COMPILE[[:space:]]*=/s@\$(LIBXUL_DIST)/@&sdk/@' config/config.mk

	export CPPFLAGS="${CPPFLAGS} -O2"
	export MOZ_WEBGL_GLX=false

	./configure --with-libxul-sdk=${srcdir}/usr/lib/xulrunner-devel-${_xul_ver} \
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
	make
}

package() {
	cd "$srcdir/${_bzrname}-build"
	emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' dist/xpi-stage/globalmenu/install.rdf)
	install -d ${pkgdir}/usr/lib/thunderbird/extensions/${emid}
	unzip -d ${pkgdir}/usr/lib/thunderbird/extensions/${emid} dist/xpi-stage/globalmenu.xpi
}

# vim:syntax=sh

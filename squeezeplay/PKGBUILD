# Maintainer: Michal Malek <michalm@jabster.pl>

pkgname=squeezeplay
_majorver_=7.8
pkgver=7.8.r9704
pkgrel=3
pkgdesc='Desktop version of Squeezebox Controller software supported by Logitech'
url='http://downloads.slimdevices.com/nightly/?ver=7.8'
license=('GPL' 'custom')
depends=('alsa-lib' 'bzip2' 'flac' 'libmad' 'libogg' 'lua51' 'lua51-expat' 'lua51-filesystem' 'lua51-socket' 'sdl' 'sdl_gfx' 'sdl_image' 'sdl_ttf' 'ttf-freefont')
conflicts=('luajson')
arch=('i686' 'x86_64' 'arm')
makedepends=('make' 'gcc' 'scons' 'subversion' 'patch')
source=("svn+http://svn.slimdevices.com/repos/jive/${_majorver_}/trunk/${pkgname}#revision=9704"
        'vanilla_sdl.patch'
        'no-error-on-warnings.patch'
        'static-libs.patch'
        'squeezeplay.desktop')
sha1sums=(SKIP
          'cd3fe5c72c58346288d69754a21d7b1b76b304ee'
          '0b785ac820d99d999c2f18c209dad3dbe88494b5'
          '3fd28a445678e9ec8c96a716a8cc77e7e43a9229'
          '8d8b30d73e11ab092c2a1b7f7a8dcd474ffc6672')
          
pkgver() {
	cd "$srcdir/$pkgname"
	local ver="$(svnversion)"
	printf "%s.r%s" "${_majorver_}" "${ver//[[:alpha:]]}"
}

build() {
	export PATH="${srcdir}/${pkgname}/bin:$PATH"
	export CFLAGS="$CFLAGS -I${srcdir}/${pkgname}/include"
	export LDFLAGS="$LDFLAGS -L${srcdir}/${pkgname}/lib"

	cd ${srcdir}/${pkgname}
	patch -p0 < ${srcdir}/vanilla_sdl.patch || return 1
	patch -p0 < ${srcdir}/no-error-on-warnings.patch || return 1
	patch -p0 < ${srcdir}/static-libs.patch || return 1

	cd "${srcdir}/${pkgname}/src/lua-5.1.1"
	sed s,^PLAT=.*$,PLAT=linux, -i Makefile
	sed s,^INSTALL_TOP=.*$,INSTALL_TOP=${srcdir}/${pkgname}, -i Makefile
	make || return 1
	make install || return 1

	cd "${srcdir}/${pkgname}/src/tolua++-1.0.92"
	sed s,/usr/local,${srcdir}/${pkgname}, -i config_linux.py
	scons || return 1
	scons install || return 1

	cd "${srcdir}/${pkgname}/src/Tremor"
	./configure --prefix=${srcdir}/${pkgname} --disable-shared || return 1
	make || return 1
	make install || return 1

	cd "${srcdir}/${pkgname}/src/squeezeplay"
	./configure --prefix=/usr || return 1
	make || return 1

	cd "${srcdir}/${pkgname}/src/squeezeplay_desktop"
	./configure --prefix=/usr || return 1
	sed s,^INSTALL_DIR=.*$,INSTALL_DIR=/usr, -i squeezeplay.sh
	make || return 1

	cd "${srcdir}/${pkgname}/src/luajson"
	./configure --libdir=/usr/share/jive || return 1
	make || return 1

	cd "${srcdir}/${pkgname}/src/luazipfilter"
	./configure --libdir=/usr/share/jive || return 1
	make || return 1

	cd "${srcdir}/${pkgname}/src/luamd5"
	make LUA=${srcdir}/${pkgname} MYNAME=sha1
	make LUA=${srcdir}/${pkgname} MYNAME=md5
}

package() {
	cd "${srcdir}/${pkgname}/src/squeezeplay"
	make install DESTDIR=${pkgdir}

	cd "${srcdir}/${pkgname}/src/squeezeplay_desktop"
	make install DESTDIR=${pkgdir}
	install -D -m755 squeezeplay.sh ${pkgdir}/usr/bin/squeezeplay.sh

	cd "${srcdir}/${pkgname}/src/luajson"
	make install DESTDIR=${pkgdir}

	cd "${srcdir}/${pkgname}/src/luazipfilter"
	make install DESTDIR=${pkgdir}

	cp -r "${srcdir}/${pkgname}/src/loop-2.2-alpha/loop/" "${pkgdir}/usr/share/jive"
	cp ${srcdir}/${pkgname}/src/luamd5/md5.so ${pkgdir}/usr/share/jive/md5.so
	cp ${srcdir}/${pkgname}/src/luamd5/sha1.so ${pkgdir}/usr/share/jive/sha1.so

	mkdir -p "${pkgdir}/usr/share/jive/fonts"
	cd "${pkgdir}/usr/share/jive/fonts"
	ln -s /usr/share/fonts/TTF/FreeSans.ttf
	ln -s /usr/share/fonts/TTF/FreeSansBold.ttf

	install -D -m644 "${srcdir}/squeezeplay.desktop" ${pkgdir}/usr/share/applications/squeezeplay.desktop
}

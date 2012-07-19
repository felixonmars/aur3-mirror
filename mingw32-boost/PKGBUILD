# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Based on mingw32-boost-static

pkgname=mingw32-boost
pkgver=1.50.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc="Free peer-reviewed portable C++ source libraries (mingw32)"
arch=(any)
_arch_target=i486-mingw32
url="http://www.boost.org/"
license=('custom')
provides=('mingw32-boost')
conflicts=('mingw32-boost')
depends=('mingw32-runtime')
# Depends on native Boost so we can use its bjam instead of building it ourself first
makedepends=('mingw32-gcc' 'boost' 'bzip2')
options=(!strip !buildflags)
source=(http://downloads.sourceforge.net/sourceforge/boost/boost_${_boostver}.tar.bz2)
md5sums=('52dd00be775e689f55a987baebccc462')

build() {
	cd "$srcdir/boost_${_boostver}"

	cat > user-config.jam << EOF
using gcc : 4.7 : ${_arch_target}-g++
	:
	<rc>${_arch_target}-windres
	<archiver>${_arch_target}-ar
;
EOF

	unset LDFLAGS
	local instprefix="${pkgdir}/usr/${_arch_target}"

	/usr/bin/bjam \
		toolset=gcc \
		target-os=windows \
		variant=release \
		threading=multi \
		threadapi=win32 \
		link=shared,static \
		runtime-link=shared \
		--prefix="$instprefix" \
		--user-config=user-config.jam \
		--without-mpi \
		--without-python \
		-sNO_BZIP2=1 \
		-sNO_ZLIB=1 \
		${MAKEFLAGS} \
		--layout=tagged install

	# --layout=tagged will add the "-mt" suffix for multithreaded libraries
	# and installs includes in /usr/include/boost.
	# --layout=system no longer adds the -mt suffix for multi-threaded libs.

	# Move all the .dll files into bin/
	install -m755 -d "$instprefix/bin"
	mv "$instprefix/lib/"*.dll "$instprefix/bin"

#  find ${pkgdir}/usr/i486-mingw32 -name *.a | xargs i486-mingw32-ranlib
	${_arch_target}-strip -x "$instprefix/bin/"*.dll
	${_arch_target}-strip -g "$instprefix/lib/"*.a
}

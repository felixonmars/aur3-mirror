# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: XercesBlue (nullfied)
# Contributor: Mikael Eriksson (miffe)
# Maintainer: N30N <archlinux@alunamation.com>
# Contributor: miffe <mikael_eriksson@miffe.org>

pkgname="blender-cycles-svn"
pkgver=41800
pkgrel=1
arch=("i686" "x86_64")
url="http://blender.org/"
depends=("desktop-file-utils" "hicolor-icon-theme" "python" "ffmpeg" "fftw" \
	"libsndfile" "openimageio-git")
makedepends=("subversion" "cmake" "sdl" "openal" "jack" "boost")
optdepends=("sdl: as your audio backend" \
	"openal: as your audio backend" \
	"jack: as your audio backend" \
	"cuda-toolkit: for GPU rendering")
provides=("blender")
conflicts=("blender")
license=("GPL2")
options=("!strip")
install="blender.install"

case "${pkgname}" in
	"blender-nurbs-svn")
		_svnmod="nurbs"
		;;
	"blender-bmesh-svn")
		_svnmod="bmesh"
		;;
	"blender-freestyle-svn")
		_svnmod="soc-2008-mxcurioni"
		;;
	*)
		pkgdesc="SVN version of Blender"
		_svnmod="trunk"
		_svntrunk="https://svn.blender.org/svnroot/bf-blender/trunk/blender"
		;;
esac

if [ -z "${_svntrunk}" ]; then
	pkgdesc="${_svnmod} SVN branch of Blender"
	_svntrunk="https://svn.blender.org/svnroot/bf-blender/branches/${_svnmod}"
fi

build() {
	msg "Connecting to SVN server..."
	if [ -d "${_svnmod}/.svn" ]; then
		(cd "${_svnmod}" && svn up -r "${pkgver}")
	else
		svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
	fi
	msg "SVN checkout done or server timeout"

	[ -d build ] && rm -rf build
	mkdir -p build
	cd build

	if [ "${CC-gcc}" = "gcc" ]; then
		export \
			CFLAGS="${CFLAGS} -ffast-math" \
			CXXFLAGS="${CXXFLAGS} -ffast-math"
	fi

	cmake \
		-DCMAKE_VERBOSE_MAKEFILE="OFF" \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DPYTHON_VERSION="$(python3 -V 2>&1 | sed -r "s/^.+\s(3\.[0-9]).*$/\1/")" \
		-DWITH_PYTHON_INSTALL="OFF" \
		-DWITH_INSTALL_PORTABLE="OFF" \
		-DWITH_PLAYER="ON" \
		-DWITH_CODEC_FFMPEG="ON" \
		-DWITH_FFTW3="ON" \
		-DWITH_JACK="ON" \
		-DWITH_CODEC_SNDFILE="ON" \
		-DWITH_OPENCOLLADA="OFF" \
		-DWITH_MEM_JEMALLOC="OFF" \
		-DWITH_CYCLES_CUDA_BINARIES="OFF" \
		-DCUDA_TOOLKIT_INCLUDE="/usr/include/cuda" \
		-DCYCLES_CUDA_BINARIES_ARCH="sm_10;sm_11;sm_12;sm_13;sm_20;sm_21" \
		../${_svnmod}

	make
	make DESTDIR="${pkgdir}" install
}

# vim: set noet ff=unix:

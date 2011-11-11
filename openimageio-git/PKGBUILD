# Contributor: N30N <archlinux@alunamation.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>

pkgname="openimageio-git"
pkgver=20111110
pkgrel=1
pkgdesc="A library for reading and writing images, and a bunch of related classes, utilities, and applications."
url="http://www.openimageio.org"
license=("BSD")
arch=("i686" "x86_64")
provides=("openimageio")
depends=("boost-libs" "glew" "openexr" "jasper" "libjpeg" "libpng" "libtiff")
optdepends=("qt: iv image viewer" "python2: for said bindings")
makedepends=("git" "cmake" "boost" "intel-tbb" "qt" "python2")

_gitroot="git://github.com/OpenImageIO/oiio.git"
_gitname="oiio"

build() {
	cd "${srcdir}"
	if [ -d "${_gitname}" ]; then
		msg "Updating local GIT repository..."
		cd "${_gitname}"
		git clean -dfx
		git reset --hard
		git pull origin
	else
		msg "Cloning GIT repository..."
		git clone "$_gitroot"
		cd "${_gitname}"
	fi
	msg2 "Done."

	# Remove the unnecessary 'Insecure RPATH' of ${dist_dir}/lib.
	sed '/set (CMAKE_INSTALL_RPATH "${LIBDIR}")/d' -i "src/CMakeLists.txt"

	# Use python2 for tests.
	# sed -r "s/(python)$/\12/" -i src/cmake/oiio_macros.cmake

	msg "Starting make..."
	make dist_dir="dist"
}

package() {
	cd "${srcdir}/${_gitname}/dist"
	install -d "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/lib" \
		"${pkgdir}/usr/lib/python2.7/site-packages"
	install -m755 bin/* "${pkgdir}/usr/bin"
	install -m755 lib/libOpenImageIO.so "${pkgdir}/usr/lib"
	install -m755 python/OpenImageIO.so \
		"${pkgdir}/usr/lib/python2.7/site-packages"
	install -Dm644 doc/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	find include \( -type f -o -type l \) -exec \
		install -Dm644 "{}" "${pkgdir}/usr/{}" \;
	cd doc
	find * \( -type f -o -type l \) -exec \
		install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;
}

# vim: set noet ff=unix:

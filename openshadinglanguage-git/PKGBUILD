# Maintainer: Maël Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname="openshadinglanguage-git"
pkgver=20130218
pkgrel=1
pkgdesc="A language for programmable shading in renderers and other applications."
url="https://github.com/imageworks/OpenShadingLanguage/#readme"
license=("BSD")
arch=("i686" "x86_64")
provides=("openshadinglanguage")
conflicts=("openshadinglanguage")
depends=("boost-libs" "llvm" "openexr" "openimageio-git")
optdepends=()
makedepends=("git" "cmake" "boost")

_gitroot="git://github.com/imageworks/OpenShadingLanguage.git"
_gitname="OpenShadingLanguage"

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
	
	
	[[ -d build ]] && rm -r build
	mkdir build && cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr ../src
	make
}

package() {
	cd ${srcdir}/${_gitname}/build

	make DESTDIR="$pkgdir/" install

	mkdir -p $pkgdir/usr/share/OSL/
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	ls $pkgdir/usr/LICENSE
	ls $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/LICENSE $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/{CHANGES,README.md,INSTALL} $pkgdir/usr/share/OSL/
	mv $pkgdir/usr/doc $pkgdir/usr/share/OSL/doc
	mv $pkgdir/usr/shaders $pkgdir/usr/share/OSL/shaders
}

# vim: set noet ff=unix:

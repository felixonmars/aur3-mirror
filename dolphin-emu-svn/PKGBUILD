# Maintainer: Joe Amenta <amentajo@msu.edu>
# Original Maintainer:  Devin Cofer <ranguvar@archlinux.us>
# Contributor: Hans-Kristian Arntzen <maister@archlinux.us>
# Contributor: Zephyr
# Special thanks to Zhou Xin <soul916@hotmail.com> for rewriting this to use cmake

pkgname=dolphin-emu-svn
pkgver=6615
pkgrel=2
pkgdesc="A GameCube and Wii emulator (Dev tree)"
arch=('i686' 'x86_64')
url="http://www.dolphin-emu.com/"
license=('GPL2')

makedepends=('subversion' 'cmake' 'glproto' 'opencl-headers')
depends=('sdl' 'libxxf86vm' 'libao' 'wxgtk>=2.8' 'wxgtk<2.9' 'wiiuse' 'nvidia-cg-toolkit' 'glew' 'mesa' 'libgl')
provides=("dolphin-emu=${pkgver}-${pkgrel}")
conflicts=('dolphin-emu' 'dolphin-emu-svn-bin' )

source=('dolphin-emu.desktop'
	'Dolphin_Logo.png')

sha256sums=('1cf1cc034ad03cf068d39fd3bac0103dfb663695966a6846e530d8b8cb363470'
	    '4ef79175305df7bb9201931870c4bedc5eda9c94b65311973dfd41c1128784d1')

_svntrunk="http://dolphin-emu.googlecode.com/svn/trunk"
_svnmod="dolphin-emu-svn"


build() {
	cd "${srcdir}"

	if [ -d "${_svnmod}/.svn" ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	mkdir -p "${srcdir}/${_svnmod}-build/build"
	cd "${_svnmod}-build/build"
	
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}
package() {
	cd "${srcdir}/${_svnmod}-build/build"

	make DESTDIR=${pkgdir} install

	install -Dm644 "${srcdir}/dolphin-emu.desktop" "${pkgdir}/usr/share/applications/dolphin-emu.desktop"
	install -Dm644 "${srcdir}/Dolphin_Logo.png" "${pkgdir}/usr/share/icons/dolphin-emu.png"
}

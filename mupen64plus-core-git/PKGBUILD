# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-core-git
pkgver=2.0.r34.gf2247c5
pkgrel=1
pkgdesc="Core of Mupen64Plus v2.0, a Nintendo 64 emulator. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-core"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(sdl libpng mesa freetype2)
makedepends=(git glproto dri2proto)
conflicts=(mupen64plus)
provides=(mupen64plus)
source=("mupen64plus-core::git+http://github.com/mupen64plus/mupen64plus-core")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-core"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/share/mupen64plus"
	mkdir -p "${pkgdir}/usr/include/mupen64plus"
	cp -P "projects/unix/"*.so.* "${pkgdir}/usr/lib"
	cp "data/"* "${pkgdir}/usr/share/mupen64plus"
	cp "src/api/"m64p_*.h "${pkgdir}/usr/include/mupen64plus"
}

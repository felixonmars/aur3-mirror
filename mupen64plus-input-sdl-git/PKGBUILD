# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-input-sdl-git
pkgver=2.0.r23.g4af586c
pkgrel=1
pkgdesc="Input plugin for Mupen64Plus v2.0, a Nintendo 64 emulator, using SDL. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-input-sdl"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-input-sdl::git+http://github.com/mupen64plus/mupen64plus-input-sdl")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-input-sdl"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} install
}

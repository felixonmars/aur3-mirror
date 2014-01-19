# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-audio-sdl-git
pkgver=2.0.r5.g1837f96
pkgrel=1
pkgdesc="Audio plugin for Mupen64Plus v2.0, a Nintendo 64 emulator, using SDL. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-audio-sdl"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git libsamplerate)
makedepends=(git)
source=("mupen64plus-audio-sdl::git+http://github.com/mupen64plus/mupen64plus-audio-sdl")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-audio-sdl"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all NO_RESAMP=0
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} install
}

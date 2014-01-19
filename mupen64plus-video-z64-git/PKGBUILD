# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-video-z64-git
pkgver=2.0.0.r7.ga958edd
pkgrel=1
pkgdesc="Low-level RDP plugin for Mupen64Plus v2.0, a Nintendo 64 emulator. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-video-z64"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git glew)
makedepends=(git)
source=("mupen64plus-video-z64::git+http://github.com/mupen64plus/mupen64plus-video-z64")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-video-z64"
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

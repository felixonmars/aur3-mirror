# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-rsp-hle-git
pkgver=2.0.r41.gcb8de21
pkgrel=1
pkgdesc="RSP processor plugin for Mupen64Plus v2.0, a Nintendo 64 emulator. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-rsp-hle"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-rsp-hle::git+http://github.com/mupen64plus/mupen64plus-rsp-hle")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-rsp-hle"
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

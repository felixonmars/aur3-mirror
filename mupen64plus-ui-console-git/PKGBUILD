# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-ui-console-git
pkgver=2.0.r12.gd1bbbcc
pkgrel=1
pkgdesc="CLI fontend for Mupen64Plus v2.0, a Nintendo 64 emulator. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-ui-console"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-ui-console::git+http://github.com/mupen64plus/mupen64plus-ui-console")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-ui-console"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr MANDIR=/usr/share/man/man6/ DESTDIR=${pkgdir} install
}

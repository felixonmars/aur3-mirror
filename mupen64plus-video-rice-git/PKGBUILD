# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-video-rice-git
pkgver=2.0.r8.gcb6db1a
pkgrel=1
pkgdesc="Video plugin for Mupen64Plus v2.0, a Nintendo 64 emulator, using OpenGL. Latest git clone."
url="http://bitbucket.org/richard42/mupen64plus-video-rice"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-video-rice::git+http://github.com/mupen64plus/mupen64plus-video-rice")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-video-rice"
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

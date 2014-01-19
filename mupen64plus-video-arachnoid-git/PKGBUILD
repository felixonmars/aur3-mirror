# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-video-arachnoid-git
pkgver=2.0.0.r6.gb881e3e
pkgrel=1
pkgdesc="Video plugin for Mupen64Plus v2.0, a Nintendo 64 emulator, based on Arachnoid for Project64. Latest git pull."
url="http://bitbucket.org/wahrhaft/mupen64plus-video-arachnoid"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-video-arachnoid::git+http://github.com/mupen64plus/mupen64plus-video-arachnoid")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-video-arachnoid"
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

# Contributer: BeholdMyGlory <larvid@gmail.com>
# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-video-glide64-git
pkgver=2.0.0.r10.g81503ec
pkgrel=1
pkgdesc="Port of the Glide64 video plugin to Mupen64Plus v2.0, a Nintendo 64 emulator. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-video-glide64"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git boost)
makedepends=(git)
source=("mupen64plus-video-glide64::git+http://github.com/mupen64plus/mupen64plus-video-glide64")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-video-glide64"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	sed -i "s,BOOST_SUFFIX ?= -mt,BOOST_SUFFIX ?= ,g" "projects/unix/Makefile"
	sed -i "s,BOOST_THREAD_SUFFIX ?= -mt,BOOST_THREAD_SUFFIX ?= ,g" "projects/unix/Makefile"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} install
}

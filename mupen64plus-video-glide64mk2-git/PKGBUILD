# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-video-glide64mk2-git
pkgver=2.0.r30.g9f18a24
pkgrel=1
pkgdesc="Video plugin for Mupen64Plus 2.0 based on 10th anniversary release code from gonetz. Latest git clone."
url="https://github.com/mupen64plus/mupen64plus-video-glide64mk2"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-git)
depends=(mupen64plus-core-git boost boost-libs)
makedepends=(git)
source=("mupen64plus-video-glide64mk2::git+http://github.com/mupen64plus/mupen64plus-video-glide64mk2")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mupen64plus-video-glide64mk2"
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

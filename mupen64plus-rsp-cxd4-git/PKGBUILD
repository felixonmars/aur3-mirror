# Maintainer: Patryk Szalanski <patryk.szalanski+aur@gmail.com>
pkgname=mupen64plus-rsp-cxd4-git
pkgver=r585.7a194de
pkgrel=1
pkgdesc="mupen64plus 2.0 port for the LLE rsp plugin. Latest git pull."
url="https://github.com/mupen64plus/mupen64plus-rsp-cxd4"
license=("GPL")
arch=(i686 x86_64)
depends=(mupen64plus-core-git)
makedepends=(git)
source=("mupen64plus-rsp-cxd4::git+http://github.com/mupen64plus/mupen64plus-rsp-cxd4")
md5sums=('SKIP')

pkgver() {
	# There were no tags, so we are just counting the revisions here
	cd "$srcdir/mupen64plus-rsp-cxd4"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/mupen64plus-rsp-cxd4/COPYING"
}

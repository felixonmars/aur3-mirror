# Contributer: BeholdMyGlory <larvid@gmail.com>
pkgname=mupen64plus-ui-console-hg
pkgver=151
pkgrel=1
pkgdesc="CLI fontend for Mupen64Plus v2.0, a Nintendo 64 emulator. Latest hg pull."
url="http://bitbucket.org/richard42/mupen64plus-ui-console"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-hg)
depends=(mupen64plus-core-hg)
makedepends=(mercurial)
conflicts=(mupen64plus)
provides=(mupen64plus)
source=("hg+https://bitbucket.org/richard42/mupen64plus-ui-console")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/${pkgname%-*}
	echo $(hg identify -n)
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix all
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	make -C projects/unix PREFIX=/usr MANDIR=/usr/share/man/man6/ DESTDIR=${pkgdir} install
}

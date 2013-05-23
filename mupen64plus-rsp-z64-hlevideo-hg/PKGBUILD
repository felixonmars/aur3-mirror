# Contributer: BeholdMyGlory <larvid@gmail.com>
_hgrepo=mupen64plus-rsp-z64
pkgname=mupen64plus-rsp-z64-hlevideo-hg
pkgver=64
pkgrel=1
pkgdesc="Low-level RSP processor plugin for Mupen64Plus v2.0, a Nintendo 64 emulator. Latest hg pull."
url="http://bitbucket.org/wahrhaft/mupen64plus-rsp-z64"
license=("GPL")
arch=(i686 x86_64)
groups=(mupen64plus-hg)
depends=(mupen64plus-core-hg)
makedepends=(mercurial)
source=("hg+http://bitbucket.org/wahrhaft/mupen64plus-rsp-z64")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/${_hgrepo}
	echo $(hg identify -n)
}

build() {
	cd "${srcdir}/${_hgrepo}"
	make -C projects/unix HLEVIDEO=1 all
}

package() {
	cd "${srcdir}/${_hgrepo}"
	make -C projects/unix PREFIX=/usr DESTDIR=${pkgdir} HLEVIDEO=1 install
}

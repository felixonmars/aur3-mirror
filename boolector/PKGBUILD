# Contributor of this PKGBUILD: Alexander Schade <schade[wtf1]in.tum[wtf2][wtf3][wtf4]>
# (where [wtf1] is 0x40, [wtf2] is 0x2E, [wtf3] is 100 in decimal, and [wtf4] is the 26-th prime)

pkgname=boolector
pkgver=1.6.0
pkgrel=1
pkgdesc='Boolector is an SMT solver for bit-vectors and arrays.'
arch=(i686 x86_64)
license=("http://fmv.jku.at/boolector/license.txt")
depends=(gcc-libs zlib glibc)
url=http://fmv.jku.at/boolector/
source=("http://fmv.jku.at/boolector/${pkgname}-${pkgver}-with-sat-solvers.tar.gz")
md5sums=(e6df9c8a0c94261c5861219d79463574)
build() {
	cd ${srcdir}/${pkgname}-${pkgver}-with-sat-solvers &&
	make all || return 1
	mkdir -p ${pkgdir}/usr/bin || return 1
	mkdir -p ${pkgdir}/usr/lib || return 1
	mkdir -p ${pkgdir}/usr/include || return 1
	install -t ${pkgdir}/usr/bin boolector/boolector || return 1
	install -t ${pkgdir}/usr/bin boolector/btor2horn || return 1
	install -t ${pkgdir}/usr/bin boolector/deltabtor || return 1
	install -t ${pkgdir}/usr/bin boolector/synthebtor || return 1
	install -t ${pkgdir}/usr/lib boolector/libboolector.a || return 1
	install -t ${pkgdir}/usr/include boolector/boolector.h || return 1
}

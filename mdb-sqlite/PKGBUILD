# Contributer: N30N <archlinux@alunamation.com>
# Contributer: Rosslaew <rosslaew@gmail.com>

pkgname="mdb-sqlite"
pkgver=1.0.2
pkgrel=2
pkgdesc="Microsoft Access MDB to SQLite converter"
url="http://code.google.com/p/${pkgname}/"
license="BSD"
arch=("i686" "x86_64")
depends=("java-runtime")
makedepends=("apache-ant")
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.bz2" "mdb-sqlite.sh")
md5sums=("a446bc43e2796a54a202c4bf6a9a7cfc" "c5950ab248e164c6806dd468e60cdfdd")

build() {
	cd "${pkgname}-${pkgver}"
	ant dist
}

package() {
	install -D -m755 mdb-sqlite.sh "${pkgdir}/usr/bin/mdb-sqlite"
	install -D -m644 "${pkgname}-${pkgver}/dist/mdb-sqlite.jar" \
		"${pkgdir}/usr/share/java/mdb-sqlite.jar"
}

# vim: set noet ff=unix

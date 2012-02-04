# Contributor: Majki <majki@majki.hu>

pkgname="scite-clang"
pkgver="2.21"
pkgrel="1"
pkgdesc="SciTE is a SCIntilla based Text Editor. (compiling with clang + config files to support for PHP and C code completion)"
arch=("i686" "x86_64")
url="http://www.scintilla.org"
license=("custom")
options=("strip")
depends=("gtk2>=2.18")
makedepends=("make" "clang")
pkgname2="${pkgname%%-*}"
pkgver2="${pkgver/\./}"
pkgextra="scite-extras.tgz"
source=("http://downloads.sourceforge.net/project/scintilla/SciTE/${pkgver}/${pkgname2}${pkgver2}.tgz" "http://majki.hu/${pkgextra}")
md5sums=("6b291afa70bdffd93f78cdf6021b9e48" "9a840b2a075c7865d2536eb9e0a2dd01")

build() {
	
	# building scintilla
	cd "${srcdir}/scintilla/gtk"
	make CLANG=1 || return 1
	
	# building scite
	cd "${srcdir}/scite/gtk"
	make CLANG=1 || return 1
	make CLANG=1 prefix="${pkgdir}/usr/" datadir="${pkgdir}/usr/share/" install || return 1

	# installing extras
	tar -C "${pkgdir}/usr/share/${pkgname2}" -xzf "${srcdir}/${pkgextra}" || return 1
		
	# copying license files
	licdir="${pkgdir}/usr/share/licenses"
	mkdir -p "${licdir}/scintilla"
	cp "${srcdir}/scintilla/License.txt" "${licdir}/scintilla/LICENSE"
	mkdir -p "${licdir}/scite"
	cp "${srcdir}/scite/License.txt" "${licdir}/scite/LICENSE"

}

# vim:ts=3

# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
pkgname=tex-unicode
pkgver=200417102138
pkgrel=4
pkgdesc="Enable UTF-8 support in LaTeX."
url="http://www.unruh.de/DniQ/latex/unicode/"
depends=('tetex')
source=("http://www.unruh.de/DniQ/latex/unicode/unicode.tgz" "http://www.latex-project.org/lppl.txt")
install="tex-unicode.install"
arch=('i686' 'x86_64')
license=('custom:"LaTeX Project Public License"')
md5sums=('1b85878cbe79f672d73da6de6e3d7d00' '11ef55b5ce8caf92b257eeb312fd3f9d')

build() {

	mkdir -p ${startdir}/pkg/usr/share/texmf/tex/latex/unicode/data
	
	cd ${startdir}/src/ucs
	
	install -m 644 ucs.sty ${startdir}/pkg/usr/share/texmf/tex/latex/unicode/ucs.sty || return 1
	install -m 644 utf8x.def ${startdir}/pkg/usr/share/texmf/tex/latex/unicode/utf8x.def || return 1
	install -m 644 ucsencs.def ${startdir}/pkg/usr/share/texmf/tex/latex/unicode/ucsencs.def || return 1
	
	cd ${startdir}/src/ucs/data
	for files in *; do
		install -m 644 $files ${startdir}/pkg/usr/share/texmf/tex/latex/unicode/data/$files || return 1
	done

	mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
	cd ${startdir}/src/ucs
	install -m 644 LICENSE ${startdir}/pkg/usr/share/licenses/$pkgname/LICENSE || return 1
	cd ${startdir}
	install -m 644 lppl.txt ${startdir}/pkg/usr/share/licenses/$pkgname/lppl.txt || return 1
}


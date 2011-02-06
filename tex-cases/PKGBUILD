# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
pkgname=tex-cases
pkgver=2.5
pkgrel=1
pkgdesc="Provides a LaTeX environment to produce multi-case equations with a separate equation number for each case."
url="http://www.ctan.org/"
depends=('tetex')
source=("http://tug.ctan.org/macros/latex/contrib/misc/cases.sty" "http://www.latex-project.org/lppl.txt")
install="tex-cases.install"
arch=('i686' 'x86_64')
license=('custom:"LaTeX Project Public License"')
md5sums=('8bcdd4087d7eaedbd85077d2c722955e'
         '11ef55b5ce8caf92b257eeb312fd3f9d')

build() {

	mkdir -p ${startdir}/pkg/usr/share/{licenses/$pkgname,texmf/tex/latex/cases}
	cd ${startdir}/src
	
	install -m 644 cases.sty ${startdir}/pkg/usr/share/texmf/tex/latex/cases/cases.sty || return 1
	install -m 644 lppl.txt ${startdir}/pkg/usr/share/licenses/$pkgname/lppl.txt || return 1
}


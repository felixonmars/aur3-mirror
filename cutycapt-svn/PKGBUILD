# Maintainer:  trashstar <trash@ps3zone.org>
# Contributor: Evan Teitelman <teitelmanevan at gmail dot com>
# Contributor: Renan Fernandes <renan@kauamanga.com.br>

pkgname=cutycapt-svn
pkgver=10
pkgrel=3
pkgdesc="A Qt and WebKit based command-line utility that captures WebKit's rendering of a web page."
arch=('i686' 'x86_64')
url="http://cutycapt.sourceforge.net/"
license=('GPL')
depends=('qt5-webkit' 'qt5-svg')
makedepends=('subversion')
provides=('cutycapt')
conflicts=('cutycapt')
source=('svn://svn.code.sf.net/p/cutycapt/code/' 'CutyCapt.patch')
md5sums=('SKIP'
         '731dfc6cd7c378faef0139052fd3b784')

pkgver() {
    cd "$SRCDEST/code"
    svnversion | tr -d [A-z]
}

prepare() {
    cd "${srcdir}/code/CutyCapt"
    patch -p1 -i "${srcdir}/CutyCapt.patch"
}

build() {    
    cd "${srcdir}/code/CutyCapt"
	qmake
	make
}

package() {
	cd "${srcdir}/code/CutyCapt"
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 "CutyCapt" "${pkgdir}/usr/bin/"
}

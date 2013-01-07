# Maintainer: buhman <zack[at]buhman[dot]org>
pkgname=relsat
pkgver=2.20
pkgrel=1
pkgdesc="solves instances of the propositional satisfiability problem (SAT)"
url='http://code.google.com/p/relsat/'
license=('GPLv2')
arch=('x86_64' 'i686')

# archive is mis-named; the sources and commits all claim to be "2.20"
source=("http://${pkgname}.googlecode.com/files/${pkgname}_2.02.tar")
md5sums=('909c5081a098d63733b4c91713c138ab')

build() {
    cd "${srcdir}"
    make -fMakefile.linux $MAKEFLAGS
}

package() {
    cd "${srcdir}"
    install -Dm755 relsat "${pkgdir}/usr/bin/relsat"
}

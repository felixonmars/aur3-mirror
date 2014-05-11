# $Id$
# Maintainer: Hanspeter Portner <agenthp (at) users.sf.net>

pkgname=flatex
pkgver=1.21
pkgrel=1
pkgdesc="Flatten a latex file into a single file, by explicitly including the files inclued by \include and \input commands and also the bibtex bilbiography (*.bbl)."
arch=('i686' 'x86_64')
url='http://www.ctan.org/pkg/flatex'
license=('PD')
source=('http://www.ctan.org/tex-archive/support/flatex/flatex.c')
md5sums=('18db4c978818c0ec5908b31d81a4f094')

build() { 
  cd "${srcdir}"
	make flatex
}

package() {
	cd "${srcdir}"
  install -d "${pkgdir}/usr/bin"
	install -s -m755 flatex "${pkgdir}/usr/bin"
}

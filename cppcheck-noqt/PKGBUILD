# $Id$
# Maintainer: philomath <philomath868 AT gmail DOT com>

pkgname=cppcheck-noqt
_base=cppcheck
pkgver=1.56
pkgrel=1
pkgdesc="A tool for static C/C++ code analysis, without the GUI"
arch=('i686' 'x86_64')
url="http://cppcheck.wiki.sourceforge.net/"
license=('GPL')
depends=('pcre')
makedepends=('docbook-xsl')
conflicts=('cppcheck')
provides=('cppcheck=1.54')
source=(http://downloads.sourceforge.net/sourceforge/${_base}/${_base}-${pkgver}.tar.bz2)
sha1sums=('63999e1a492f73408fcad87b4bef3c2775feb7e5')

build() {
   cd "${srcdir}/${_base}-${pkgver}"
   make
   make DB2MAN=/usr/share/xml/docbook/xsl-stylesheets-1.77.1/manpages/docbook.xsl man
}

package() {
   cd "${srcdir}/${_base}-${pkgver}"
   make DESTDIR="${pkgdir}" install

   install -D -p -m 644 cppcheck.1 "${pkgdir}"/usr/share/man/man1/cppcheck.1
}

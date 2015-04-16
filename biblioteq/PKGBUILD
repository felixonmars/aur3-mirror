# Contributor: Jason Perry <sh.jperry at gmail dot com>
pkgname=biblioteq
pkgver=10.00
pkgrel=1
pkgdesc="BiblioteQ is an Open Source Cataloging and Library Management Suite"
url="http://biblioteq.sourceforge.net/"
arch=('i686' 'x86_64')
license="BSD"
depends=('qt4' 'yaz' 'sqlite')
makedepends=()
optdepends=('postgresql: For connecting to remote catalogs')
source=("http://downloads.sourceforge.net/project/biblioteq/Version%20${pkgver}/BiblioteQ.d.tar.gz"
        "biblioteq.desktop")
md5sums=('1444b54e087b14ec97f70d9365245b0c'
         '7832504ae483ee4d4baeecbb33855bef')
build() {
  cd "${srcdir}/biblioteq.d"
  qmake-qt4 -o Makefile biblioteq.pro 
  make
}
 
package() {
  cd "${srcdir}/biblioteq.d"
  make INSTALL_ROOT="${pkgdir}" install

  install -d -m 0755 "${pkgdir}"/usr/share/applications
  install -m 0644 "${srcdir}"/biblioteq.desktop "${pkgdir}"/usr/share/applications
  install -D -m 0644 "${srcdir}"/biblioteq.d/Icons/book.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/biblioteq.png
}

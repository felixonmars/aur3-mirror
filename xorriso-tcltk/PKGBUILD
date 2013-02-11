# Maintainer: dreieck
pkgname=xorriso-tcltk
pkgver=1.2.7
pkgrel=1
pkgdesc='A Tcl/Tk proof-of-concept-GUI for xorriso, an "ISO 9660 Rock Ridge filesystem manipulator".'
arch=('i686' 'x86_64')
depends=('tcl' "tk>=8.4" 'bwidget' "xorriso>=1.2.6")
url="http://www.gnu.org/software/xorriso/"
license=("GPLv3")
source=("http://libburnia-project.org/export/head/libisoburn/trunk/frontend/${pkgname}"
        "http://svn.libburnia-project.org/libisoburn/trunk/frontend/README-tcltk")
sha1sums=('cd7cf3b835f0134550dff635af90c9062199616b'
          'ed7e5725ec7b4b5524573b1e7d449fa92ccf2a7c')

build() {
  cd "$srcdir"
  chmod a+x "${pkgname}"
}

package() {
  cd "$srcdir"
  
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  cp xorriso-tcltk "${pkgdir}/usr/bin/"
  cp README-tcltk "${pkgdir}/usr/share/doc/${pkgname}/"
}


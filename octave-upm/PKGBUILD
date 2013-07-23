# Maintainer: Israel Herraiz <isra@herraiz.org>

pkgname=octave-upm
pkgver=3.6.4+R8.2
pkgrel=2
pkgdesc="A high-level language, primarily intended for numerical computations (this is the Octave UPM edition)."
arch=('i686' 'x86_64')
url="http://mat.caminos.upm.es/octave"
license=('GPL')
depends=( 'qt4' 'octave') 
options=('!emptydirs')
source=('http://mat.caminos.upm.es/octave/src/gui.tar.bz2')
md5sums=('111c73046b10c6d5d98c9009516fe777')

build() {
  cd ${srcdir}/gui/
  qmake-qt4
  cd qterminal && qmake-qt4 && make libqterminal/Makefile
  cd libqterminal && make
  cd ../.. && make
}

package(){
  cd ${srcdir}/gui
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  mkdir ${pkgdir}/usr/lib
  mkdir ${pkgdir}/usr/share
  mkdir ${pkgdir}/usr/share/octave-upm
  mkdir ${pkgdir}/usr/share/octave-upm/config
  mkdir ${pkgdir}/usr/share/octave-upm/languages
  cp src/bin/octave-upm ${pkgdir}/usr/bin/
  cd ${srcdir}
  cp gui/qscintilla/Qt4Qt5/libqscintilla2_octave_upm.so.8.0.2 ${pkgdir}/usr/lib/
  cd ${pkgdir}/usr/lib
  ln -s libqscintilla2_octave_upm.so.8.0.2 libqscintilla2_octave_upm.so.8
  cd ${srcdir}
  cp gui/src/bin/config/settings ${pkgdir}/usr/share/octave-upm/config
  cp gui/src/bin/languages/es-es.qm ${pkgdir}/usr/share/octave-upm/languages
  cp gui/src/bin/languages/generic.qm ${pkgdir}/usr/share/octave-upm/languages
}

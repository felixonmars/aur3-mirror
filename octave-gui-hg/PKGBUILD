# Maintainer: Israel Herraiz <isra@herraiz.org>

pkgname=octave-gui-hg
pkgver=3.7.0+
pkgrel=1
pkgdesc="A high-level language, primarily intended for numerical computations (including the new official experimental GUI)."
arch=('i686' 'x86_64')
url="http://www.octave.org"
license=('GPL')
depends=('qscintilla' 'qt' 'octave-hg') 
makedepends=('octave-hg' 'mercurial' 'git')
options=('!emptydirs')
source=('some_fixes.patch')
md5sums=('8f9a58fcdb09bfdbad386e6890ef10af')

build() {
  cd ${srcdir}/
  hg clone http://www.octave.org/hg/octave -r gui

  cd octave/
  cat ../../some_fixes.patch | patch -p1

  cd gui && qmake
  cd qterminal && qmake && make libqterminal/Makefile
  cd libqterminal && make
  cd .. && make
  cd .. && make
}

package(){
  cd ${srcdir}/octave
  mkdir ${pkgdir}/usr
  mkdir ${pkgdir}/usr/bin
  cp gui/bin/octave-gui ${pkgdir}/usr/bin/

  # add octave library path to ld.so.conf.d
  install -d ${pkgdir}/etc/ld.so.conf.d
  echo "/usr/lib/octave/${pkgver}/" > ${pkgdir}/etc/ld.so.conf.d/${pkgname}-dev.conf
}

# Contributor: leepesjee <lpeschier at xs4all.nl>
pkgname=gluplot
pkgver=1.9
pkgrel=2
pkgdesc="A data plotting OpenGL/GLU/glut based 2D/3D graphical library program, supporting high quality plot output to PS, EPS and PDF files."
arch=('i686' 'x86_64')
url="http://wwwinfo.jinr.ru/programs/jinrlib/gluplot/indexe.html"
license=('GPL')
depends=('fltk' 'freeglut' 'libxpm')
source=(http://wwwinfo.jinr.ru/programs/jinrlib/gluplot/$pkgname-$pkgver.tar.gz
        gluplot-1.3.0-draw.patch)
md5sums=('0f60883595a13c5656c3274990fd0c37'
         '1a7ef6b04bf509a1758b09f1c7338e71')

build() {
  cd $startdir
  patch -Np0 -i ./gluplot-1.3.0-draw.patch
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|tolower|::tolower|' ./src/plot/glp_plot_gl.cpp
  sed -i '/^using namespace std;/i #include <cstdlib>' ./src/test/terrain.cpp
  sed -i 's|Fl_File_Chooser.h|Fl_File_Chooser.H|' ./src/gui.h

  ./configure --prefix=/usr --enable-fltk
  sed -i 's|mandir = ${datarootdir}|mandir = ${DESTDIR}/${datarootdir}|' ./docs/Makefile
  sed -i 's|docdir = ${datarootdir}|docdir = ${DESTDIR}/${datarootdir}|' ./docs/html/Makefile

  make || return 1
  make DESTDIR="$pkgdir/" install
}

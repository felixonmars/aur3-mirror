# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=katmus
pkgver=0.16
pkgrel=3
pkgdesc="Application for manual music transcription."
arch=('i686' 'x86_64')
url="http://katmus.sourceforge.net"
license=('GPL')
depends=('qt4' 'mpg123' 'vorbis-tools' 'libao' 'fftw' 'lilypond' 'timidity++' 'rubberband')
source=("http://downloads.sourceforge.net/katmus/$pkgname$pkgver.tar.bz2"
	"unistd.patch")
md5sums=('896312ed70719a43fadc467efecb52fa'
         '33720138011ad619e567166b447d93d1')
build() {
  patch -Np0 < unistd.patch

  cd $srcdir/$pkgname
  qmake-qt4
  make -j1 || return 1
  make INSTALL_ROOT="$pkgdir" install || return 1
}

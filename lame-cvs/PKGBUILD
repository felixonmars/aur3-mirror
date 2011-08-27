# Contributor:  Mladen Pejakovic <pejakm@gmail.com>

pkgname=lame-cvs
pkgver=20110401
pkgrel=1
pkgdesc="An MP3 encoder and graphical frame analyzer - cvs"
arch=('i686' 'x86_64')
url="http://lame.sourceforge.net/"
depends=('ncurses')
makedepends=('nasm' 'cvs')
provides=('lame=3.98.4','lame-cvs')
conflicts=('lame')
license=('LGPL')
options=('!libtool')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@lame.cvs.sourceforge.net:/cvsroot/lame"
_cvsmod="lame"

build() {
  cd ${srcdir}
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/usr --enable-nasm --enable-shared
  make
}

package() {
  cd ${srcdir}/$_cvsmod
  make DESTDIR="${pkgdir}" install
}

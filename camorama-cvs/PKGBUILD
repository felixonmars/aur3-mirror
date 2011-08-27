# Contributor:  Mikkel Poulsen <whargoul.mikkel@gmail.com>
pkgname=camorama-cvs
pkgver=20060118
pkgrel=
pkgdesc="A webcam application featuring various image filters."
url="http://camorama.fixedgear.org/"
license=
depends=('libgnomeui' 'x-server')
provides=('camorama')
conflicts=('camorama')
makedepends=('cvs')
source=()
md5sums=()


_cvsroot=":pserver:anonymous@anoncvs.gnome.org:/cvs/gnome"
_cvsmod="camorama"

build() {
  cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod
  ./autogen.sh
  
  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

  
  

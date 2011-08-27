# Maintainer: Dmitrij D. Czarkoff <czarkoff@gmail.com>
pkgname=gnubg-cvs
pkgver=20110815
pkgrel=1
pkgdesc="A world class backgammon application"
arch=('i686' 'x86_64')
url="http://www.gnubg.org/"
license=('GPL')
depends=('python' 'gtkglext' 'bison' 'flex')
makedepends=('cvs' 'openssh')
conflicts=(gnubg)
install=gnubg.install
source=('gnubg.desktop')
md5sums=('80c17298770dceebd9c91beedab0ac29')

_cvsmod=gnubg

build() {
  cd "$srcdir"
  if [ -f $SRCDEST/${pkgname}.tar.gz ]
  then
    msg "Unpacking previous sources"
    tar xzf $SRCDEST/${pkgname}.tar.gz
  fi

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  export CVS_RSH="ssh"
  if [[ -d "${_cvsmod}/CVS" ]]; then
    cd "${_cvsmod}"
    cvs -z3 update
  else
    cvs -z3 -d:pserver:anonymous@cvs.savannah.gnu.org:/sources/gnubg co $_cvsmod
    cd "$_cvsmod"
  fi

  cd ..
  msg "CVS checkout done"

  msg "Backing up source tree"
  tar czf $SRCDEST/${pkgname}.tar.gz ${_cvsmod}

  msg "Starting make..."

  cd "${srcdir}/${_cvsmod}"

  ./autogen.sh || return 1
  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc --mandir=/usr/share/man || return 1
  make || return 1
}

package() {
  install -m 644 -D "${srcdir}/gnubg.desktop" "${pkgdir}/usr/share/applications/gnubg.desktop"
  cd "${srcdir}/${_cvsmod}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

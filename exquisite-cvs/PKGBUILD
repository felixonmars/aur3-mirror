# Contributor: fancris3 <fancris3 at aol.com>

pkgname=exquisite-cvs
pkgver=20080117
pkgrel=2
pkgdesc="a psplash replacement that is very simple and uses EFL"
arch=(i686 x86_64)
groups=('e17-cvs')
url="http://www.enlightenment.org"
license="BSD"
depends=('edje-cvs')
makedepends=('cvs')
options=('!libtool')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@anoncvs.enlightenment.org:/var/cvs/e"
_cvsmod="e17/apps/exquisite"


build() {
  cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [ -d $_cvsmod/CVS ]; then
  cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -r $startdir/src/exquisite-build
  cp -r $startdir/src/e17/apps/exquisite $startdir/src/exquisite-build
  cd $startdir/src//exquisite-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
  install -D -m644 COPYING-PLAIN $startdir/pkg/usr/share/licenses/$pkgname/COPYING-PLAIN
}

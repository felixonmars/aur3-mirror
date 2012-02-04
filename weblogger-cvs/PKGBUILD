# Contributor: Rodrigo S. Wanderley <rodrigoswanderley@gmail.com>
pkgname=weblogger-cvs
pkgver=20080227
pkgrel=1
pkgdesc="Weblogger: Blogging within Emacs"
arch=('i686' 'x86_64')
url="https://savannah.gnu.org/projects/emacsweblogs/"
makedepends=('cvs')
depends=('emacs')
license=('GPL')
install=weblogger.install
conflicts=('weblogger')
provides=('weblogger')
source=()
md5sums=()

_cvsroot=":pserver:anonymous@cvs.savannah.nongnu.org:/sources/emacsweblogs"
_cvsmod="weblogger"

build() {
  cd $startdir/src/

  msg "Getting Weblogger sources through CVS..."

  cd $startdir/src
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co $_cvsmod
    cd $_cvsmod
  fi

  cd lisp

  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/weblogger
  cp *.el $startdir/pkg/usr/share/emacs/site-lisp/weblogger
}


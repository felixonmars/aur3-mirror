# Contributor: Johan Busk <busk(at)lysator(dot)liu(dot)se>
arch=(i686 x86_64)
pkgname=lyskom-cvs
pkgver=20080411
pkgrel=1
pkgdesc="The emacslisp client for the lyskom conference system. This will checkout and package the latest CVS version."
url="http://www.lysator.liu.se/lyskom/klienter/emacslisp/"
license=GPL
depends=('emacs')
provides=()
conflicts=()
makedepends=('cvs')
source=()
md5sums=()

_cvsroot=":pserver:anonymous:@cvs.lysator.liu.se:/cvsroot/lyskom-elisp-client"
_cvsmod="lyskom-elisp-client"

build() {
  cd $startdir/src
  msg "Connecting to Lysators CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi
#  ./autogen.sh

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  make EMACS=emacs || return 1
  
  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp	 
  mv $startdir/src/$_cvsmod-build/src/lyskom.elc $startdir/pkg/usr/share/emacs/site-lisp	
  rm -r $startdir/src/$_cvsmod-build
}
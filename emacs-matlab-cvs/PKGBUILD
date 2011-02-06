# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=emacs-matlab-cvs
pkgver=20100121
pkgrel=1
pkgdesc="MATLAB / Emacs integration project"
arch=('any')
url="http://matlab-emacs.sourceforge.net/"
license=('GPL')
depends=('emacs' 'cedet')
makedepends=('cvs')
install=$pkgname.install

_cvsroot=:pserver:anonymous@matlab-emacs.cvs.sourceforge.net:/cvsroot/matlab-emacs
_cvsmod=matlab-emacs

build() {
  cd $srcdir

  msg "Connecting to CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -dP
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod || return 1
    cd $_cvsmod
  fi
  msg "CVS checkout done or server timeout"
  msg "Starting build ..."

  make PREFIX=$pkgdir/usr || return 1

  install -d $pkgdir/usr/share/emacs/site-lisp/
  cp -a $srcdir/$_cvsmod $pkgdir/usr/share/emacs/site-lisp/

  find $pkgdir -name CVS -exec rm -r {} +
  find $pkgdir -name .cvsignore -exec rm {} +
  find $pkgdir -name '*~' -exec rm {} +
}

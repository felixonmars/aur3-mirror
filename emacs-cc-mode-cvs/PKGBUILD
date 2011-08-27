# Contributor: m039 <flam44 (at) gmail (dot) com>

pkgname=emacs-cc-mode-cvs
pkgver=20110617
pkgrel=1
pkgdesc="CC Mode is an Emacs and XEmacs mode for editing C and other languages with similar syntax."
url="http://cc-mode.sourceforge.net/index.php"
arch=('any')
license=('GPL2')
depends=('emacs')
makedepends=('cvs')
install=$pkgname.install

_cvsroot=":pserver:anonymous@cc-mode.cvs.sourceforge.net:/cvsroot/cc-mode"
_cvsmod="cc-mode"

_pkg_emacs=$pkgdir/usr/share/emacs/site-lisp/
_pkg_info=$pkgdir/usr/share/info/

build() {
  cd $srcdir
  
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi  

  make
  make info

  install -d $_pkg_info
  install -d $_pkg_emacs/$_cvsmod/
  
  install -m644 $srcdir/$_cvsmod/*.{el,elc}   -t $_pkg_emacs/$_cvsmod/
  install -m644 $srcdir/$_cvsmod/cc-mode.info -t $_pkg_info/  
}

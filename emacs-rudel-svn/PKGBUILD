# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>
pkgname=emacs-rudel-svn
pkgver=471
pkgrel=1
pkgdesc="A collaborative editing environment for GNU Emacs"
arch=('any')
url="http://www.emacswiki.org/emacs/Rudel"
license=('GPL')
depends=('emacs' 'cedet')
install=$pkgname.install
source=()
md5sums=()

_svntrunk=https://rudel.svn.sourceforge.net/svnroot/rudel/trunk
#_svntrunk=http://qjoypad.svn.sourceforge.net/svnroot/qjoypad/tags/4.0-pre
_svnmod=rudel

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  msg "Starting make..."
  cd $_svnmod

  emacs --script rudel-compile.el || return 1

  mkdir -p $startdir/pkg/usr/share/emacs/site-lisp/rudel
  cp -a * $startdir/pkg/usr/share/emacs/site-lisp/rudel || return 1
}

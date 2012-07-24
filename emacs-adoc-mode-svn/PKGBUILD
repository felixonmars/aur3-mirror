# Maintainer: Nick Smallbone <nick.smallbone@gmail.com>
pkgname=emacs-adoc-mode-svn
pkgver=395
pkgrel=1
pkgdesc="AsciiDoc mode for Emacs, with plenty of syntax highlighting"
arch=('any')
url="http://code.google.com/p/sensorflo-emacs/wiki/AsciiDoc"
license=('GPL')
depends=('emacs')
makedepends=('subversion')

_svntrunk=http://sensorflo-emacs.googlecode.com/svn/trunk/adoc-mode
_svnmod=adoc-mode

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
}

package() {
  cd "$srcdir/$_svnmod"
  install -Dm644 adoc-mode.el "$pkgdir/usr/share/emacs/site-lisp/adoc-mode.el"
}

# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ejacs-svn
pkgver=11
pkgrel=1
pkgdesc="JavaScript/ECMAScript console for emacs"
arch=('any')
url="http://code.google.com/p/ejacs"
license=('GPL')
depends=('emacs')
makedepends=('subversion')
provides=('ejacs')
conflicts=('ejacs')
source=("ejacs::svn+http://ejacs.googlecode.com/svn/trunk/")
md5sums=('SKIP')
_svnmod="ejacs"

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"/"${_svnmod}"
  emacs -batch -q -L . -f batch-byte-compile *.el
}

package() {
  cd "$srcdir"/"${_svnmod}"
  for _f in *.el? README; do
    install -Dm 644 $_f ${pkgdir}/usr/share/emacs/site-lisp/$_f
  done
}

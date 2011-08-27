# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=emacs-libmpdee-svn
pkgver=4992
pkgrel=2
pkgdesc="An Emacs Lisp client library for MPD."
arch=('any')
url="http://mpd.wikia.com/wiki/Client:Libmpdee"
license=('GPL')
depends=('emacs')
makedepends=('subversion')
provides=('emacs-libmpdee')
conflicts=('emacs-libmpdee')

_svntrunk="https://svn.musicpd.org/libmpdee/trunk"
_svnmod=libmpdee

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  emacs --batch -f batch-byte-compile *.el || return 1

  install -d "$pkgdir/usr/share/emacs/site-lisp" || return 1
  install -m 644 *.{el,elc} "$pkgdir/usr/share/emacs/site-lisp" || return 1
}

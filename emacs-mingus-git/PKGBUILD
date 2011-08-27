# Contributor: Alexander Tsamutali <astsmtl@yandex.ru>

pkgname=emacs-mingus-git
pkgver=20100413
pkgrel=1
pkgdesc="A frontend for GNU Emacs to the Music Player daemon."
arch=('any')
url="http://github.com/pft/mingus"
license=('GPL')
depends=('emacs')
makedepends=('git')
provides=('emacs-mingus')
conflicts=('emacs-mingus' 'emacs-libmpdee')
install=emacs-mingus-git.install

_gitroot="git://github.com/pft/mingus.git"
_gitname="mingus"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  for file in libmpdee.el mingus.el
  # FIXME: mingus-stays-home.el should be byte-compiled too.
  do
    emacs --batch -f batch-byte-compile $file || return 1
  done

  install -d "$pkgdir/usr/share/emacs/site-lisp/" || return 1
  for file in *.{el,elc}
  do
    install -v -m 644 $file "$pkgdir/usr/share/emacs/site-lisp/" || return 1
  done
}

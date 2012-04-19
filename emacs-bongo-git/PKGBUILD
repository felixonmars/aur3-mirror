# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Luminous Fennell <mstrlu_REMOVETHIS_@gmx.net>

pkgname=emacs-bongo-git
pkgver=20120419
pkgrel=1
pkgdesc="Buffer-oriented media player for GNU Emacs"
arch=('any')
url="https://github.com/dbrock/bongo"
license=('GPL2')
depends=('emacs')
makedepends=('git')
install=emacs-bongo.install

_gitroot=https://github.com/dbrock/bongo.git
_gitname=emacs-bongo-git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  # Only info file has to be built
  mkdir info
  makeinfo bongo.texinfo -o info/bongo  
}

package() {
  cd "$srcdir/$_gitname-build"

  # install bongo
  mkdir -p "$pkgdir/usr/share/emacs/site-lisp/bongo"
  cp -r -t "$pkgdir/usr/share/emacs/site-lisp/bongo" \
    bongo.el \
    lastfm-submit.el \
    etc

  # install helper applications
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r -t "$pkgdir/usr/share/$pkgname" contrib
  
  # install info manual
  mkdir -p "${pkgdir}/usr/share/info"
  cp -r -t "${pkgdir}/usr/share/info" info/bongo
  
  # install misc. documentation
  mkdir -p "${pkgdir}/usr/share/docs/$pkgname"
  cp -r -t "${pkgdir}/usr/share/docs/$pkgname" \
    AUTHORS \
    COPYING \
    HISTORY \
    NEWS \
    README.rdoc
}

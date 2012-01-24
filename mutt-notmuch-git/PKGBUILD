# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=mutt-notmuch-git
pkgver=20120124
pkgrel=1
pkgdesc="Notmuch (of a) helper for Mutt"
arch=('any')
url="http://upsilon.cc/~zack/blog/posts/2011/01/how_to_use_Notmuch_with_Mutt/"
license=('GPL3')
depends=('perl' 'perl-mailtools' 'perl-mail-box' 'notmuch')
makedepends=('git')
provides=('mutt-notmuch')
conflicts=('mutt-notmuch')

_gitroot=http://git.upsilon.cc/r/utils/mutt-notmuch.git
_gitname=mutt-notmuch

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

  make
  gzip ${_gitname}.1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"
  install -Dm644 "${_gitname}.1.gz" "${pkgdir}/usr/share/man/man1/${_gitname}.1.gz"
}

# vim:set ts=2 sw=2 et:

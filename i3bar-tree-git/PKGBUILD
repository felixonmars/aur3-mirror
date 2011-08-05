# Maintainer: Andrwe Lord Weber  <lord-weber-andrwe [at] andrwe [dot] org>

pkgname=i3bar-tree-git
pkgver=20110805
pkgrel=1
pkgdesc="An xcb-based status- and ws-bar for i3 - tree-version"
arch=('i686' 'x86_64')
url="http://git.merovius.de/i3bar/"
license=('BSD')
makedepends=('git' 'pkgconfig' 'asciidoc' 'i3-wm')

_gitroot="git://git.merovius.de/i3bar"
_gitname="i3bar"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  git checkout tree

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install || return 1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1
  install -Dm644 doc/i3bar.1 ${pkgdir}/usr/share/man/man1/i3bar.1 || return 1

  make clean
}

# vim:set ts=2 sw=2 et:



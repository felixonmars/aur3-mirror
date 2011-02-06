# Maintainer: Olivier Keun  <olivier [dot] keun [at] gmail [dot] com>

pkgname=i3bar-git
pkgver=20101120
pkgrel=1
pkgdesc="An xcb-based status- and ws-bar for i3"
arch=('i686' 'x86_64')
url="http://git.merovius.de/i3bar/"
license=('BSD')
makedepends=('git' 'pkgconfig' 'asciidoc')

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
  git checkout next

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install || return 1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE || return 1

  make clean
}

# vim:set ts=2 sw=2 et:



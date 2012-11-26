# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=mplayctl-git
pkgver=20121125
pkgrel=1
pkgdesc="Mplayer daemon + controller"
arch=('any')
url="http://code.gtmanfred.com/cgit/mplayctl.git/"
license=('custom')
depends=('zsh' 'mplayer')
makedepends=('git')

_gitroot=git://code.gtmanfred.com/mplayctl.git
_gitname=mplayctl

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
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:

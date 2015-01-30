# Maintainer: Sietse van der Molen <sietse at vdmolen.eu>
pkgname=comcast-git
pkgver=1
pkgrel=1
pkgdesc="Simulating shitty network connections so you can build better systems. "
arch=('any')
url="https://github.com/tylertreat/Comcast"
license=('Apache')
makedepends=('git' 'go')
options=('!strip' '!emptydirs')

_gitroot=git@github.com:tylertreat/Comcast.git
_gitname=Comcast

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

  go build
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 "Comcast-build" "$pkgdir/usr/bin/comcast"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:


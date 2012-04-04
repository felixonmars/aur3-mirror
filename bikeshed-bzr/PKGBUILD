# Contributor: Héctor Acosta <hector.acosta@gmail.com>
pkgname=bikeshed-bzr
pkgver=156
pkgrel=1
pkgdesc="Random useful tools that do not yet have a permanent home"
pkgdesc=""
arch=('any')
url="https://code.launchpad.net/bikeshed"
license=('GPL')
groups=()
depends=()
makedepends=('bzr')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()

_bzrtrunk="http://bazaar.launchpad.net/~bikeshed/bikeshed/trunk/"
_bzrmod="bikeshed"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
md5sums=()

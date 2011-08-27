# Maintainer: SpepS  <dreamspepser at yahoo dot it>

_pkg=qin
pkgname=$_pkg-git
pkgver=20110820
pkgrel=1
pkgdesc="LV2 synth plugin for plucking sounds."
arch=(i686 x86_64)
url="https://github.com/magnusjonsson/qin"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2core')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg.ttl")
md5sums=('d5b013e0769fa9fce25c00909f19af6a')

_gitroot=https://github.com/magnusjonsson/$_pkg.git
_gitname=$_pkg

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

  # set right dest path
  sed -i "s|/usr/local|$pkgdir/usr|" Makefile

  # fix schema to work with zynjacku
  sed -e '2,3d;1,7!d;' \
      -e '1a@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.' \
      -e '7a\ \ rdfs:seeAlso <qin.ttl> .' \
      -i manifest.ttl

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make install

  # add missing schema
  install -Dm644 "$srcdir/$_pkg.ttl" "$pkgdir/usr/lib/lv2/mj-qin.lv2"
}

# vim:set ts=2 sw=2 et:

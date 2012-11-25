# Maintainer: Tom Vincent <http://tlvince.com/contact>
_pkgname=mpd-tools
pkgname=$_pkgname-git
pkgver=20121122
pkgrel=1
pkgdesc="A collection of scripts to control mpd"
arch=(any)
url="https://github.com/tlvince/mpd-tools"
license=("MIT")
depends=("mpc")
makedepends=("git")

_gitroot=git://github.com/tlvince/mpd-tools.git
_gitname=$_pkgname

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
}

package() {
  cd "$srcdir/$_gitname-build/src"

  for i in *; do
    install -Dm755 "$i" "$pkgdir/usr/bin/$i"
  done

  install -Dm644 ../license.mkd "$pkgdir/usr/share/licenses/mpd-tools/license.txt"
}

# vim:set ts=2 sw=2 et:

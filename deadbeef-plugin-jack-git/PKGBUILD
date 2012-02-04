# Maintainer: Giancarlo Bianchi <giancarlobianchi76@gmail.com>
pkgname=deadbeef-plugin-jack-git
pkgver=20111226
pkgrel=1
pkgdesc="JACK output plugin for DeaDBeeF"
arch=('i686' 'x86_64')
url="http://gitorious.org/deadbeef-sm-plugins/pages/Home"
license=('unknown')
depends=('deadbeef')
makedepends=('git' 'jack')
conflicts=('jack_output_for_deadbeef')

_gitname=jack
_gitroot=git://gitorious.org/deadbeef-sm-plugins/${_gitname}.git

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
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm0755 jack.so "$pkgdir/usr/lib/deadbeef/jack.so"
}

# vim:set ts=2 sw=2 et:
md5sums=()

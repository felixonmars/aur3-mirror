# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Martin Zeller <mz dot bremerhaven at gmail dot com>
pkgname=green-git
pkgver=0.2
pkgrel=1
pkgdesc="A light weight PDF reader"
arch=('i686' 'x86_64')
url="https://github.com/schandinat/green"
license=('GPL3')
depends=('poppler-glib' 'sdl')
makedepends=('git')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/schandinat/green.git"
_gitname=green

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
  make

  gzip green.1
}

package() {
  cd "$srcdir/$_gitname-build"
  install -Dm755 green "$pkgdir/usr/bin/green"
	install -Dm644 green.1.gz "$pkgdir/usr/share/man/man1/green.1.gz"
}

# vim:set ts=2 sw=2 et:

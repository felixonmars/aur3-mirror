# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=amtterm-git
pkgver=20130222
pkgrel=1
pkgdesc="Intel AMT SoL client + tools"
arch=('i686' 'x86_64')
url="https://www.kraxel.org/cgit/amtterm/"
license=('GPL2')
depends=('vte' 'perl-soap-lite')
makedepends=('git')

_gitroot=git://git.kraxel.org/amtterm
_gitname=amtterm

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

  sed -i 's#/usr/local#/usr#' mk/Variables.mk

  export prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install

  cd "$srcdir"
  rm -rf "$srcdir/$_gitname-build"
}

# vim:set ts=2 sw=2 et:

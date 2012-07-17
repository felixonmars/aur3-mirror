# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>
# -git version: Berseker <berseker86@gmail.com>


pkgname=nitrogen-git
pkgver=20120717
pkgrel=1
pkgdesc="Background browser and setter for X windows - git version"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
makedepends=('git')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg')
conflicts=('nitrogen')
replaces=('nitrogen')
source=(nitrogen.desktop)

install=nitrogen-git.install

_gitroot=https://github.com/l3ib/nitrogen.git
_gitname=nitrogen

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin glade
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

#  ./autogen.sh
  autoreconf -f -i

# ./install-sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$srcdir"/nitrogen.desktop "${pkgdir}"/usr/share/applications/nitrogen.desktop
}
md5sums=('a4b70efdc49a17b5a5632d6c2deb8566')

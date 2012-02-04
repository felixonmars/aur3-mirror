# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Marc Hudson <marxom@gmail.com>

pkgname=tribe-git
pkgver=20110904
pkgrel=1
pkgdesc="Tribe - Chakra LiveCD Installer"
arch=('i686' 'x86_64')
url="http://chakra-project.org/"
license=('GPL')
depends=('qt>=4.4.0' 'kdelibs' 'kdebase-workspace' 'polkit-qt' 'kdeedu-marble' 'arxin' 'rsync' 'parted' 'aqpm' 'e2fsprogs')
makedepends=('cmake' 'git')
provides=('tribe')
conflicts=('tribe')
groups=()
source=()
md5sums=()

_gitroot="git://gitorious.org/chakra/tribe.git"
_gitname="tribe"

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

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

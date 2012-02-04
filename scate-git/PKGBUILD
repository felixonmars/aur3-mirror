# $Id$
# Maintainer: Arch Linux Pro Audio <dev@archaudio.org>
# Contributor:  Bernardo Barros <bernardobarros@gmail.com>

pkgname=scate-git
pkgver=20110104
pkgrel=1
pkgdesc="Scate: Kate SuperCollider plugin"
arch=(i686 x86_64)
url="https://github.com/jleben/Scate/"
license=('GPL')
groups=()
depends=()
makedepends=('cmake' 'automoc4' 'kdesdk-kate')
provides=(scate)
conflicts=(scate)
replaces=()
backup=()
options=()
install=
source=()
md5sums=()
noextract=()

_gitroot="git://github.com/jleben/Scate.git"
_gitname="Scate"


build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    (cd $_gitname && git pull origin)
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/Scate"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR="$pkgdir/" install
}

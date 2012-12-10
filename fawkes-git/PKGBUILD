# Maintainer: Till Hofmann <hofmann@kbsg.rwth-aachen.de>
pkgname=fawkes-git
pkgver=20121210
pkgrel=1
pkgdesc="A component-based Software Framework for Robotic Real-Time Applications for various Platforms and Domains."
arch=('x86_64' 'i686')
license=('GPL2')
url="http://www.fawkesrobotics.org/"
depends=()
makedepends=('git' 'fawkes-devenv')
provides=('fawkes')
conflicts=('fawkes')
replaces=()
options=(!buildflags)
source=("arch.patch"
        "skillspace.patch")
noextract=()
md5sums=('d24545cb8c19cfd0a023511d8b39c217'
         'd018610a15e12e26b4e0014a54c75543')
_gitroot=git://git.fawkesrobotics.org/fawkes.git
_gitname=fawkes

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

  patch -p1 < $srcdir/arch.patch
  patch -p1 < $srcdir/skillspace.patch
  make switch-buildtype-archlinux
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install DESTDIR=$pkgdir
}


# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=osc-build-git
_pkgname=osc-build
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=20111013
pkgrel=1
pkgdesc="The build software used for Open Build Service - git"
url="http://build.opensuse.org"
license=("GPL")
depends=(bash perl perl-timedate binutils tar subversion)
builddepends=(bash)
makedepends=(subversion)
arch=(i686 x86_64)
source=()
md5sums=()
_gitroot="git://gitorious.org/opensuse/build.git"
_gitname="build"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Install..."

  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}

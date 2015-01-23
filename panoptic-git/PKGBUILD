pkgname=panoptic-git
pkgver=r537.61978d0
pkgrel=1
pkgdesc="Spherical Cube Map viewing applications built on the Thumb engine. With 3D & Oculus Rift support."
arch=(i686 x86_64)
url="https://forums.oculus.com/viewtopic.php?f=42&t=19493&p=238738"
license=('GPL')
makedepends=('git')
source=("panoptic::git+https://github.com/rlk/panoptic.git"
      "scm::git+https://github.com/rlk/scm.git"
      "thumb::git+https://github.com/rlk/thumb.git"
      "util3d::git+https://github.com/rlk/util3d.git")

md5sums=(SKIP SKIP SKIP SKIP) #generate with 'makepkg -g'

pkgver() {
  cd "$srcdir/panoptic"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/panoptic"
#  git submodule update --init
  git submodule add "$srcdir/util3d" util3d || true
  git config submodule.util3d.url "$srcdir/util3d" || true
  git submodule init
  git submodule update

  sed -i 's/-lthumb -lscm/-lthumb -lscm -lz -lGLEW/g' Makefile

  cd "$srcdir/scm"
  git submodule add "$srcdir/util3d" util3d || true
  git config submodule.util3d.url "$srcdir/util3d" || true
  git submodule init
  git submodule update
}

build() {

  cd "$srcdir/thumb"
  make

  cd "$srcdir/scm"
  make

  cd "$srcdir/panoptic"
  make
}

package() {
  cd "$srcdir/panoptic"
  #make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/bin"
  install -m755 Release/panoptic "$pkgdir/usr/bin/panoptic"
}

# vim:set ts=2 sw=2 et:

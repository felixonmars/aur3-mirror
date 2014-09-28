# Maintainer: Danny Su <contact@dannysu.com>

pkgname=asymmetricfs-git
pkgver=r116.382e958
pkgrel=1
pkgdesc='An Asymmetric, Encrypting Filesystem for Userspace'
arch=('i686' 'x86_64')
url="https://github.com/ckennelly/asymmetricfs"
license=('GPL3')
depends=('fuse' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
optdepends=()
source=('git+https://github.com/ckennelly/asymmetricfs.git'
        'git+http://git.chromium.org/external/googletest.git')
sha1sums=('SKIP' 'SKIP')

_gitname=asymmetricfs

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule init
  git config submodule.googletest $srcdir/thirdparty/googletest
  git submodule update
}

# cmake .
# make

build() {
  cd "$srcdir/$_gitname"
  cmake .
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp "$srcdir/$_gitname/src/asymmetricfs" "$pkgdir/usr/bin/"
}

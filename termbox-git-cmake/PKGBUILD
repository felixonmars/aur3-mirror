# PKGBUILD for termbox-git-cmake
pkgname=termbox-git-cmake
pkgver=20140706
pkgrel=1
pkgdesc="Library for writing text-based user interfaces"
arch=(i686 x86_64)
url="https://github.com/nsf"
makedepends=(cmake git)
conflicts=(termbox-git)
source=("CMakeLists.txt")
sha256sums=('360ff763af4950d1e8fa3a56e23932a5eb19213441a7f9394727e312ea8b4f4a')

build() {
  cd "$srcdir"
  if [[ ! -d "termbox" ]]; then
    git clone "https://github.com/nsf/termbox.git"
  fi
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
  make
}

package() {
  cd "$srcdir"
  make install
}

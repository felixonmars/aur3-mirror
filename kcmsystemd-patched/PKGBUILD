_gitname=kcmsystemd
pkgname="${_gitname}-patched"
pkgver=r153.b82330f
pkgrel=2
pkgdesc="Systemd control module for KDE - Git prepatched version."
arch=('i686' 'x86_64')
url='https://github.com/rthomsen/kcmsystemd'
license=(GPL)
depends=(kconfigwidgets boost-libs)
makedepends=(extra-cmake-modules python boost)
provides=(kcmsystemd)
conflicts=(kcmsystemd kcmsystemd-git kcmsystemd-kde4)
source=("git+https://github.com/rthomsen/${_gitname}.git"
        "kdesu-path.patch")
md5sums=('SKIP'
         '69a7d6aa5b92ee78bf835d9f44dee08b')

pkgver() {
  cd $_gitname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_gitname
  patch -p1 < ../kdesu-path.patch
  mkdir -p build
}

build() {
  cd "${_gitname}/build"
  cmake .. \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_LIBDIR=lib \
   -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="$pkgdir" install
}

# Maintainer: Pavel Lymarev <x-user at bk dot ru>
# Contributor: Antonio Rojas <arojas at archlinux dot org>

_gitname=kcmsystemd
pkgname="${_gitname}-git"
pkgver=1.1.0.r22.gb82330f
pkgrel=3
pkgdesc="Systemd control module for KDE - Git version."
arch=('i686' 'x86_64')
url='https://github.com/rthomsen/kcmsystemd'
license=(GPL)
depends=(kconfigwidgets boost-libs)
makedepends=(git extra-cmake-modules python boost)
provides=(kcmsystemd)
conflicts=(kcmsystemd kcmsystemd-patched kcmsystemd-kde4)
replaces=(kcmsystemd-patched)
source=("git+https://github.com/rthomsen/${_gitname}.git"
        "kdesu-path.patch")
sha256sums=('SKIP'
            '19c1843f99ec81de075b71851ab14d6abf82b22b03f5c4eb7084fafbbfedc2de')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

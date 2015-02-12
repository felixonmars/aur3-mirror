# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=kcm-about-distro
_pkgname=about-distro
pkgver=2.0.1
pkgrel=1
pkgdesc="KCM displaying distribution and system information"
arch=('i686' 'x86_64')
url='https://projects.kde.org/about-distro'
license=('GPL3')
depends=('kconfigwidgets' 'solid')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/stable/$_pkgname/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        "kcm-about-distrorc"
        "arch-logo.png")
md5sums=('bfde9eea480fb59af8c1817ed39fd8c2'
         '8e8694a89a103bf12ae58e589c9440db'
         '3a0eaa26e5fb5fd14dd261e785091c19')

build() {
  cd "$srcdir"
  mkdir build
  cd build
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/kcm-about-distrorc" "$pkgdir/etc/xdg/kcm-about-distrorc"
  install -Dm644 "$srcdir/arch-logo.png" "$pkgdir/usr/share/$_pkgname/arch-logo.png"
}

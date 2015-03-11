# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdebase-runtime-amarok
pkgver=14.12.3
pkgrel=1
pkgdesc="Trimmed version of kdebase-runtime with only needs for Amarok"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-runtime'
license=('GPL' 'LGPL')
depends=('kdelibs' 'kactivities' 'smbclient' 'libssh' 'libcanberra' 'oxygen-icons' 'libwebp')
makedepends=('pkg-config' 'cmake' 'automoc4' 'kdepimlibs' 'openslp' 'doxygen' 'libkactivities4' 'boost')
provides=('khelpcenter' 'notification-daemon' 'kdebase-runtime')
conflicts=('kdebase-runtime')
install="kdebase-runtime.install"
source=("http://download.kde.org/stable/applications/${pkgver}/src/kde-runtime-${pkgver}.tar.xz")
sha256sums=('5129d19b4bc59529aacf722fabd046c7f58d90df47b967047787145c8398cd22')

prepare() {
  mkdir build

  cd kde-runtime-${pkgver}
}

build() {
  cd build
  cmake ../kde-runtime-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_QNtrack=OFF \
    -DSAMBA_INCLUDE_DIR=/usr/include/samba-4.0 \
    -DWITH_NepomukCore=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  rm "${pkgdir}"/usr/share/icons/hicolor/index.theme

  ln -sf /usr/lib/kde4/libexec/kdesu "${pkgdir}/usr/bin/"

  # FS#36668
  chown :nobody "${pkgdir}"/usr/lib/kde4/libexec/kdesud
  chmod g+s "${pkgdir}"/usr/lib/kde4/libexec/kdesud
}

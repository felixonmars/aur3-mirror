# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=webkitgtk
pkgname=webkitgtk4
pkgver=2.5.3
pkgrel=1
pkgdesc="GTK+ Web content engine library"
arch=(i686 x86_64)
url="http://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt sqlite libsoup enchant libgl geoclue gtk3 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu wayland)
makedepends=(gperf gobject-introspection python mesa ruby gtk-doc)
options=(!libtool !emptydirs)
source=(http://webkitgtk.org/releases/$_pkgname-${pkgver}.tar.xz)
sha256sums=('010803e371ac92a3e0e297e929978f83a9a3c597e4a10d50363fb1aaa6ea18d6')

build() {
  cd $_pkgname-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DPORT=GTK -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
  cd $_pkgname-$pkgver
  make -j1 DESTDIR="$pkgdir" install
}

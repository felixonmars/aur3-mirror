# Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_basepkgname=webkitgtk2
pkgname=icaclient-libwebkitgtk
pkgver=1.10.2
pkgrel=8
pkgdesc="32 bit gtk2+ webkit library needed to run selfservice storefront interface"
arch=(x86_64)
url="http://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt sqlite libsoup enchant libgl geoclue gtk2 gstreamer0.10-base  icu)
makedepends=(lib32-libsoup lib32-gstreamer0.10-base gperf gobject-introspection python2 mesa ruby gtk-doc bison flex patch lib32-enchant lib32-dbus-glib lib32-gstreamer0.10)
optdepends=()
provides=("libwebkit=${pkgver}")
conflicts=(libwebkit)
replaces=(libwebkit)
options=(!emptydirs)
source=(http://webkitgtk.org/releases/webkitgtk-${pkgver}.tar.xz
        bison3.patch)
sha256sums=('19234f8e4edfaefe91ed06471a2aa8c71d26dd55d33787eede1dcfc9a3a96d9c'
            '0996b25d17be61470678c18db9bfad1bf807aac410690fb8935370dbc8b3ce34')

prepare() {
  cd webkitgtk-$pkgver
  patch -Np1 -i ../bison3.patch
}

build() {
  cd webkitgtk-$pkgver

  export CXXFLAGS='-m32'
  export CFLAGS='-m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS='-m32'


  PYTHON=/usr/bin/python2 ./configure --prefix=/usr \
    --libexecdir=/usr/lib/$pkgname \
    --enable-introspection \
    --disable-webkit2 \
    --disable-geolocation \
    --with-gstreamer=0.10 \
    --with-gtk=2.0

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make all stamp-po
}

package() {
  cd webkitgtk-$pkgver
  mkdir -p $pkgdir/usr/lib32/pkgconfig/
  install -m 0755 .libs/libwebkitgtk-1.0.so $pkgdir/usr/lib32/
  cd $pkgdir/usr/lib32/ 
  ln -s libwebkitgtk-1.0.so libwebkitgtk-1.0.so.0.17.5
  ln -s libwebkitgtk-1.0.so libwebkit-1.0.so
}

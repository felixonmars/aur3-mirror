# Maintainer: Daniele Vazzola <daniele.vazzola@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbasename=webkitgtk2
pkgname=lib32-$_pkgbasename
pkgver=1.10.2
pkgrel=1
pkgdesc="gtk2+ webkit library (32-bit)"
arch=(x86_64)
url="http://webkitgtk.org/"
license=(custom)
depends=(lib32-libxt lib32-libxslt sqlite lib32-libsoup lib32-enchant lib32-libgl gtk2 lib32-gstreamer0.10 lib32-gstreamer0.10-base lib32-icu $_pkgbasename)
makedepends=(lib32-libsoup lib32-gstreamer0.10-base gperf gobject-introspection python2 mesa ruby gtk-doc bison flex patch lib32-enchant lib32-dbus-glib lib32-gstreamer0.10)
optdepends=()
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
    --libdir=/usr/lib32 \
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
  mkdir -p ${pkgdir}/
  cd "${srcdir}/webkitgtk-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share,bin}

}

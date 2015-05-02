# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgbase=webkitgtk
pkgbase=webkitgtk-hidpi
pkgname=(webkitgtk-hidpi webkitgtk2-hidpi)
pkgver=2.4.8
pkgrel=2
pkgdesc="GTK+ Web content engine library patched for HiDPI display support (https://bugs.webkit.org/show_bug.cgi?id=131347)"
arch=(i686 x86_64)
url="http://webkitgtk.org/"
license=(custom)
depends=(libxt libxslt sqlite libsoup enchant libgl geoclue2 gst-plugins-base-libs
         libsecret libwebp harfbuzz-icu)
makedepends=(gtk3 gtk2 gperf gobject-introspection python2 mesa ruby)
optdepends=('gst-plugins-base: free media decoding'
            'gst-plugins-good: media decoding'
            'gst-libav: nonfree media decoding')
options=(!emptydirs)
source=(http://webkitgtk.org/releases/$_pkgbase-${pkgver}.tar.xz
        fix-pretty-quotes.patch bug140241.patch
        webkit-hidpi.patch
        webkitgtk-2.4.8-gmutexlocker.patch)
sha256sums=('68f11559cb178679ca92acc9e3a3d7febede7acb7b98afd7fb761875bbc6bd23'
            '56316228bbbf0b7ebcbe210a35120f4e72cb9c1b680dd82cc2bde0f4549245e6'
            'a08d43d45e9c226197d4bc4257a416bcb3507bebd2d9c9e8554d1002ddbbe537'
            '0256a9218c0ebc936f06d2a1a1a8e5cc8ade9d209b2284945e00553dc63e2d68'
            'fabd056013b6d3408b359419a1440ec9c31ce970878f4502a2781bd56b3feff1')

prepare() {
  mkdir build-gtk{,2} path

  ln -s /usr/bin/python2 path/python

  cd $_pkgbase-$pkgver
  patch -Np0 -i ../fix-pretty-quotes.patch

  # Fix build bug; https://bugs.webkit.org/show_bug.cgi?id=140241 patch v3
  patch -Np1 -i ../bug140241.patch

  # fix build with new glib2
  patch -Np1 -i ../webkitgtk-2.4.8-gmutexlocker.patch
  
  patch -Np1 -i ../webkit-hidpi.patch

  autoreconf -vfi
}

_build() {
  _ver="$1"; shift
  cd "$srcdir/build-${_ver}"

  ../$_pkgbase-$pkgver/configure --prefix=/usr \
    --libexecdir=/usr/lib/webkit${_ver} \
    --enable-introspection \
    --disable-webkit2 \
    --disable-gtk-doc \
    "$@"

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make all stamp-po
}

build() {
  PATH="$srcdir/path:$PATH"

  _build gtk
  _build gtk2 --with-gtk=2.0
}

package_webkitgtk-hidpi() {
  depends+=(gtk3)
  optdepends+=('gtk2: Netscape plugin support')
  provides=("webkitgtk3=${pkgver}" "libwebkit3=${pkgver}" webkitgtk)
  conflicts=(webkitgtk3 libwebkit3 webkitgtk)
  replaces=(webkitgtk3 libwebkit3)

  make -C build-gtk -j1 DESTDIR="$pkgdir" install
  install -Dm644 $_pkgbase-$pkgver/Source/WebKit/LICENSE \
    "$pkgdir/usr/share/licenses/webkitgtk/LICENSE"
}

package_webkitgtk2-hidpi() {
  pkgdesc+=" for GTK2"
  depends+=(gtk2)
  provides=("libwebkit=${pkgver}" webkitgtk2)
  conflicts=(libwebkit)
  replaces=(libwebkit)

  make -C build-gtk2 -j1 DESTDIR="$pkgdir" install
  install -Dm644 $_pkgbase-$pkgver/Source/WebKit/LICENSE \
    "$pkgdir/usr/share/licenses/webkitgtk2/LICENSE"
}

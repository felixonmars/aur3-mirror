# $Id: PKGBUILD 74082 2012-07-19 19:40:24Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

_pkgbasename=libpulse
pkgname=libx32-$_pkgbasename
pkgdesc="A featureful, general-purpose sound server (x32 ABI client libraries)"
pkgver=2.1
pkgrel=1.1
arch=(x86_64)
url="http://pulseaudio.org/"
license=(GPL LGPL)
depends=(libx32-dbus-core libx32-json-c
         libx32-libasyncns libx32-libcap libx32-libxtst libx32-libsm libx32-libsndfile
         $_pkgbasename)
makedepends=(gcc-multilib-x32 libtool-multilib intltool libx32-glib2 libx32-speex libx32-gtk2)
optdepends=('libx32-alsa-plugins: ALSA support')
provides=("libx32-pulseaudio=$pkgver")
conflicts=(libx32-pulseaudio)
replaces=(libx32-pulseaudio)
options=(!emptydirs !libtool)
source=("http://freedesktop.org/software/pulseaudio/releases/pulseaudio-$pkgver.tar.xz")
sha256sums=('ef6b347bf47abfb98080795f1583018ac959b4aeb4df916b879f9e1eaba0ca7f')

_libs="libpulse.la libpulse-simple.la libpulse-mainloop-glib.la"
_pkglibs="libpulsecommon-$pkgver.la libpulsedsp.la"

build() {
  cd "$srcdir/pulseaudio-$pkgver"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/libx32 \
    --libexecdir=/usr/libx32 \
    --localstatedir=/var \
    --disable-hal \
    --disable-tcpwrap \
    --disable-rpath \
    --disable-default-build-tests

  # fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -C src $_libs $_pkglibs
}

package() {
  cd "$srcdir/pulseaudio-$pkgver"
  make -j1 -C src DESTDIR="$pkgdir" \
    lib_LTLIBRARIES="$_libs" pkglib_LTLIBRARIES="$_pkglibs" \
    install-libLTLIBRARIES install-pkglibLTLIBRARIES
  make -j1 DESTDIR="$pkgdir" install-pkgconfigDATA
}

# Maintainer: Zachary Huff <zach.huff.386@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gst-plugins-good-c920
_pkgname=gst-plugins-good
pkgver=1.0.7
pkgrel=2
pkgdesc="GStreamer Multimedia Framework Good Plugins (Logitech C920 Patch)"
arch=('any')
license=('LGPL')
url="http://gstreamer.freedesktop.org/"
depends=('libpulse' 'jack' 'libsoup' 'gst-plugins-base-libs' 'wavpack' 'aalib' 'taglib' 'libdv' 'libshout' 'libvpx' 'gdk-pixbuf2' 'libcaca' 'libavc1394' 'libiec61883' 'libxdamage' 'v4l-utils' 'cairo')
makedepends=('gstreamer' 'speex' 'flac' 'libraw1394')
provides=('gst-plugins-good=1.0.7')
conflicts=('gst-plugins-good')
options=(!libtool !emptydirs)
source=(${url}/src/$_pkgname/gst-plugins-good-$pkgver.tar.xz
        logitech-c920.patch)
sha256sums=('a016a3b377c86658627aef902b9204108209100b2e88fcc3b695c392af1b4035'
            'e3a79836d26637bb95545e5de3712c43d07aad9e017a0c3ad7f81364cd9520a0')

build() {
  cd $_pkgname-$pkgver
  patch -p1 -i "$srcdir/logitech-c920.patch"
  sed -i -e '/AC_PATH_XTRA/d' configure.ac
  aclocal -I m4 -I common/m4
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-experimental \
    --with-package-name="GStreamer Good Plugins (Archlinux)" \
    --with-package-origin="http://www.archlinux.org/"
  make
}

package() {
  cd $_pkgname-$pkgver
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install
}

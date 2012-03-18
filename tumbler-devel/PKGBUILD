# Maintainer:  cuihao <cuihao dot leo at gmail dot com>

# Original PKGBUILD (extra/tumbler):
# $Id: PKGBUILD 148946 2012-02-05 11:57:15Z ibiru $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>

pkgname=tumbler-devel
_pkgname=tumbler
pkgver=0.1.23
pkgrel=1
pkgdesc="D-Bus service for applications to request thumbnails (Development Version)"
arch=('i686' 'x86_64')
url="http://git.xfce.org/xfce/tumbler/"
license=('GPL2' 'LGPL')
depends=('dbus-glib' 'gdk-pixbuf2')
makedepends=('intltool' 'ffmpegthumbnailer' 'gstreamer0.10' 'poppler-glib'
             'libgsf' 'libopenraw' 'freetype2')
optdepends=('ffmpegthumbnailer: for video thumbnails'
            'gstreamer0.10: for video thumbnails'
            'poppler-glib: for PDF thumbnails'
            'libgsf: for ODF thumbnails'
            'libopenraw: for RAW thumbnails'
            'freetype2: for font thumbnails')
options=('!libtool')
source=(http://archive.xfce.org/src/apps/$_pkgname/0.1/$_pkgname-$pkgver.tar.bz2)
sha256sums=('b3066d17b7e1fee5135eb876a7c2c50a1221bd0d447c3dd7c36efe6d7f3874cb')

groups=('xfce4-devel')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

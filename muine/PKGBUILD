# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben Mazer <blm@groknil.org>

pkgname=muine
pkgver=0.8.11
pkgrel=5
pkgdesc="A music player written in C Sharp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://muine.gooeylinux.org/"
depends=('gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gconf-sharp' 'taglib-sharp' 'notify-sharp' 'musicbrainz' 'desktop-file-utils' 'gnome-icon-theme')
makedepends=('intltool' 'gnome-common')
optdepends=('gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs')
options=('!libtool')
install=muine.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.8/$pkgname-$pkgver.tar.bz2
        use-coloredcellrendererpixbuf.patch
        fix-multimedia-key-support.patch
        use-notify-sharp.patch
        fix-deprecations.patch
        use-standard-icons.patch
        use-dbus-sharp.patch
        fix-db-build.patch
        drop-gnome-sharp-dependency.patch)
md5sums=('f2a74519d9e9c6c4fca9c5217a13964a'
         '44d9b28b79b182e1efb1c56910994c5f'
         '983072d2aa9b64baa8fc185e5bc6459b'
         '28fbe637f970980ae71114e2e97500f8'
         '1344a8a188cd89f6e7c1a38f3a52d277'
         '322768fd2df44fc635c09df4fa82641b'
         'f060bbb8214f9070534519d2a28bb4dd'
         '9d8e89b348ed4a8987b7a149cca514a2'
         'ff82e558d126c4f9dc9425d825831922')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -R -i "$srcdir/use-coloredcellrendererpixbuf.patch"
  patch -Np1 -i "$srcdir/fix-multimedia-key-support.patch"
  patch -Np1 -i "$srcdir/use-notify-sharp.patch"
  patch -Np1 -i "$srcdir/fix-deprecations.patch"
  patch -Np1 -i "$srcdir/use-standard-icons.patch"
  patch -Np1 -i "$srcdir/use-dbus-sharp.patch"
  patch -Np1 -i "$srcdir/fix-db-build.patch"
  patch -Np1 -i "$srcdir/drop-gnome-sharp-dependency.patch"

  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

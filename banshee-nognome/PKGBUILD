# Maintainer: Oliver Sherouse <first dot last at gmail dot com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=banshee-nognome
_pkgname=banshee
pkgver=2.4.1
pkgrel=1
pkgdesc="Media management and playback (no GNOME dependencies)"
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('MIT')
depends=(gstreamer0.10-base-plugins glib2 dbus-sharp-glib libmtp mono-zeroconf 
boo libwebkit gdata-sharp gtk-sharp-beans gudev-sharp gkeyfile-sharp libgpod 
mono-upnp desktop-file-utils hicolor-icon-theme xdg-utils media-player-info)
makedepends=('intltool')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs'
            'brasero: CD burning')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!libtool')
install=$pkgname.install
source=(http://download.gnome.org/sources/$_pkgname/2.4/$_pkgname-$pkgver.tar.xz
        banshee-recent-gpod.patch)
md5sums=('18d77594e524ff5e51c5cca5c6b31a34'
         'e988bb83e1a49e5f0da5958e8af6508e')
build() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/banshee-recent-gpod.patch"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-docs \
              --disable-static \
              --disable-scrollkeeper \
              --disable-schemas-install \
              --disable-gnome \
              --with-vendor-build-id=ArchLinux
  make
}

package() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:

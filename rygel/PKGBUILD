# Contributor: Thijs Vermeir <thijsvermeir@gmail.com>
# Contributor: Denis Zawada <deno@rootnode.net>
# Contributor: Paolo Bacchilega <paolo dot bacchilega at libero dot it>

pkgname=rygel
pkgver=0.12.5
pkgrel=1
pkgdesc="Share audio, video and pictures on your home network."
arch=('i686' 'x86_64')
url="http://live.gnome.org/Rygel"
license=('LGPL')
depends=('gupnp-av>=0.9.0'
'gupnp-dlna>=0.5.0'
'gssdp>=0.11.0'
'gtk3'
'hicolor-icon-theme'
'libgee>=0.5.2'
'libsoup>=2.34.0'
'util-linux>=1.41.3'
'sqlite3>=3.5')
makedepends=('gtk-doc' 'pkgconfig' 'intltool')
replaces=('gupnp-media-server')
options=('!libtool')
install=rygel.install
source=("http://ftp.gnome.org/pub/GNOME/sources/rygel/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")

build() {
cd "$srcdir/$pkgname-$pkgver"
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
--disable-static --enable-gst-launch-plugin --enable-tracker-plugin \
--enable-media-export-plugin --enable-external-plugin \
--enable-mediathek-plugin --disable-silent-rules
make
}

package() {
cd "$srcdir/$pkgname-$pkgver"
make DESTDIR=$pkgdir install
}
md5sums=('1a52accbbe8ccb178ab428e6c1abd7a3')

# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=longomatch
pkgver=0.18.19
pkgrel=1
pkgdesc="Video analysis software for sport analysts with unlimited possibilities"
arch=('i686' 'x86_64')
license=('GPL')
url="http://longomatch.org/"
depends=('db4o' 'mono-addins' 'gstreamer0.10-base-plugins' 'gnonlin' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-bad-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz
        fix-plugins-longomatch-0.18.19.patch)
sha256sums=('694828397aed213d3d561c1ba7d9040ddb044fae2f8f7d26b6c7d38c69d196f3'
            'cc503b0da16fe8ec5fe2adf31dcb66dc3b7014402923f088949308e2cbf0e91b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/fix-plugins-longomatch-0.18.19.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

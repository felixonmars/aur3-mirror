# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: jsteel <jsteel at vorx dot com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Sigurd H Jakobsen <sigurd.jakobsen@gmail.com>

pkgname=libvalhalla
pkgver=2.1.0
pkgrel=1
pkgdesc="A tiny media scanner library."
arch=('i686' 'x86_64')
url="http://libvalhalla.geexbox.org/"
license=('LGPL')
depends=('ffmpeg-compat' 'sqlite3' 'libexif' 'libnfo-hg')
source=(http://libvalhalla.geexbox.org/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('5653ef94243eb9127656aaa97442f002')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export PKG_CONFIG_PATH=/usr/lib/ffmpeg-compat/pkgconfig
  export LDFLAGS="-Wl,-rpath=/usr/lib/ffmpeg-compat"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

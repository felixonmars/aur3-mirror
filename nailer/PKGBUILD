# Maintainer: jsteel <mail at jsteel dot org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Mr_Smiley <archlinux__mr-smiley.org> (GConf support)

pkgname=nailer
pkgver=0.4.6
pkgrel=1
pkgdesc="Use MPlayer to generate thumbnails of video media files"
arch=('i686' 'x86_64')
url="http://kdekorte.googlepages.com"
license=('GPL2')
depends=('mplayer' 'gdk-pixbuf2')
makedepends=('pkgconfig' 'gconf')
install=$pkgname.install
source=(http://mplayer-video-thumbnailer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('8b8686891e49112db56d1a8eb7e1f4c9')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/usr/share --disable-static

  make 
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

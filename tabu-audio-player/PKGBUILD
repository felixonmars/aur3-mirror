pkgname=tabu-audio-player
pkgver=2.2
_pkgver=2.2
pkgrel=3
pkgdesc="A simple gstreamer audio player with client-side decorations"
arch=('i686' 'x86_64')
url="http://kalmbach.wordpress.com/"
license=('GPL3')
makedepends=('pkg-config' 'intltool')
depends=('gtk2' 'gstreamer0.10' 'taglib')
source=(http://dl.dropbox.com/u/1321434/${pkgname}_${_pkgver}.tar.gz)
md5sums=('3ff7704c60291279da706afe89bb5b9d')

build() {
   cd "$srcdir"/${pkgname}-${_pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  #install -Dm644 images/tabu.png "$pkgdir"/usr/share/pixmaps/tabu.png
}

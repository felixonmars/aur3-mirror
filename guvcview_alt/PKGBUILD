pkgname=guvcview_alt
pkgver=1.1.1
pkgrel=1
pkgdesc="A video viewer and capturer for the linux uvc driver" 
arch=('i686' 'x86_64')
url="http://guvcview.berlios.de/"
license=('GPL')
depends=('portaudio' 'sdl' 'gtk2' 'twolame')
makedepends=()
provides=()
conflicts=('guvcview-svn' 'guvcview')
replaces=()
backup=()
options=()
install=
source=(http://download.berlios.de/guvcview/$pkgname-src-$pkgver.tar.gz)
noextract=()
md5sums=('bed07c263505e560b1c2cc4c3fecb80f')

build() {
  cd "$srcdir/guvcview-src-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

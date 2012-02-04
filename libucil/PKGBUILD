# Maintainer: jordi Cerdan (jcerdan) <jcerdan@tecob.com>
pkgname=libucil
pkgver=0.9.8
pkgrel=1
pkgdesc="Provides easy to use functions to render text and graphic overlays onto video images"
arch=('i686' 'x86_64')
url="http://unicap-imaging.org"
options=('!libtool')
license=('GPL')
depends=('alsa-lib' 'libunicap' 'libtheora' 'pango' 'libvorbis')
makedepends=('pkgconfig perlxml')
source=(http://unicap-imaging.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('be48e766945a9a54bdf50fc0bbe39200')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-ucil-png || return 1 
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

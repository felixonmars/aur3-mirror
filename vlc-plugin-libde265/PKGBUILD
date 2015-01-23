# Maintainer: maz_1 < loveayawaka@gmail.com> 
pkgname=vlc-plugin-libde265
_gitname=vlc-libde265
pkgver=0.1.6
pkgrel=1
pkgdesc="Libde265 plugin (an open h.265 video codec implementation) for vlc."
arch=('i686' 'x86_64')
url="https://github.com/strukturag/vlc-libde265"
license=('LGPL3')
depends=( "glibc" "libde265" "vlc")
source=( "https://codeload.github.com/strukturag/vlc-libde265/zip/$pkgver" )
md5sums=('e10ea13e0095b152ee3cd79b47c1b13f')

build() {
  cd ${_gitname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd ${_gitname}-${pkgver}
  make PREFIX=/usr DESTDIR="$pkgdir" install
  find "$pkgdir" -name "*.la" -delete
  mkdir -p $pkgdir/usr/lib/vlc/plugins/codec
  mv $pkgdir/usr/lib/*.so*  $pkgdir/usr/lib/vlc/plugins/codec
}

# Maintainer: docwild <jacksawild at hotmail dot co dot uk>

pkgname=polyclipper
pkgver=6.1.3a
pkgrel=1
pkgdesc="Polygon Clipping Library"
arch=('i686' 'x86_64')
url="http://www.angusj.com/delphi/clipper/documentation/Docs/Overview/_Body.htm"
license=('Boost Software License - Version 1.0')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/polyclipping/clipper_ver${pkgver}.zip") 
md5sums=('4dcd043ce48de59714f07bd3ec7ac62b')
build() {
  cd "$srcdir/cpp"
  [ -d "$srcdir/build" ] && rm -R "$srcdir/build"
  mkdir "$srcdir/build" -p
  cd "$srcdir/build"
  cmake ../cpp \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local/ \
    -DBUILD_SHARED_LIBS=True
  make
  
}
package(){
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
  mkdir "$pkgdir/usr/lib/pkgconfig/" -p
  
  install -Dm644 "$pkgdir/usr/local/share/pkgconfig/polyclipping.pc" "$pkgdir/usr/lib/pkgconfig/"
  rm -Rf "$pkgdir/usr/local/share"
  
  
}
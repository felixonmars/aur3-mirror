# Maintainer: Jason S. Wagner <jason at jasonswagner dot com>
pkgname=snowmix
pkgver=0.4.5
pkgrel=1
pkgdesc="Video mixer for mixing live and recorded video feeds"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/snowmix/"
license=('GPL3')
depends=('sdl' 'tcl' 'pango' 'gcc-libs')
source=(http://downloads.sourceforge.net/project/snowmix/Snowmix-$pkgver.tar.gz)
sha256sums=('b847b327764e96a895ca93d24cf12595459aaea1e802571c90b2345750544022')

build() {
cd "$srcdir/Snowmix-$pkgver"
sed -i 's|-ltcl8.5|-ltcl -lpng|g' src/Makefile.am
sed -i 's|tcl8.5/||g' src/tcl_interface.h
sed -i 's|tcl8.5/||g' configure.ac
sh strapboot
sh bootstrap
export CPPFLAGS=-DUSE_INTERP_RESULT
./configure --prefix=/usr
cd src
sed -i 's|//#include <unistd.h>|#include <unistd.h>|' video_feed.cpp
make
}

package() {
  cd "$srcdir/Snowmix-$pkgver/src"
  make DESTDIR="$pkgdir" install
}

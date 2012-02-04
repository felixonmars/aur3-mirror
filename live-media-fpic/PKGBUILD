# Maintainer: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Previous Maintainer: Marco Maso <demind@gmail.com>
# Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=live-media-fpic
pkgver=2010.11.17
pkgrel=1
pkgdesc="A set of C++ libraries for multimedia streaming"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://live555.com/liveMedia"
depends=('gcc-libs')
provides=("live-media=$pkgver")
conflicts=('live-media')
source=("http://live555.com/liveMedia/public/live.$pkgver.tar.gz")
md5sums=('f08e00a18bf4cd5058e05a869b934d4e')

build () {
 cd $startdir/src/live

 sed -i "s|COMPILE_OPTS =.*|COMPILE_OPTS = \$(INCLUDES) -I. -DSOCKLEN_T=socklen_t -D_LARGEFILE_SOURCE=1 $CFLAGS -fPIC |g" config.linux

 ./genMakefiles linux
 make
}

package () {
 cd $startdir/src/live

 for dir in BasicUsageEnvironment UsageEnvironment groupsock liveMedia; do
  mkdir -p "$pkgdir/usr/lib/live-media/$dir"
  cp -r "$dir"/*.a "$dir/include" "$pkgdir/usr/lib/live-media/$dir"
 done

 mkdir -p "$pkgdir/usr/bin"
 for testprog in $(find testProgs -type f -perm 755); do
  install "$testprog" "$pkgdir/usr/bin"
 done
}

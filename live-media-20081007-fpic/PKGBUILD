#Maintainer: Marco Maso <demind@gmail.com>
#Contributor: Gilles CHAUVIN <gcnweb@gmail.com>

pkgname=live-media-20081007-fpic
pkgver=1
pkgrel=2
pkgdesc="A set of C++ libraries for multimedia streaming"
arch=(i686 x86_64)
license=('LGPL')
url="http://live555.com/liveMedia/"
depends=(gcc-libs)
provides=('live-media>=2008.09.02')
conflicts=("live-media")
source=(http://live555.com/liveMedia/public/live.2008.10.07.tar.gz)
md5sums=('2c9d78e1f059e95bb94b97e301d50341')

build()
{
  cd $startdir/src/live
  sed -i "s|COMPILE_OPTS =.*|COMPILE_OPTS = \$(INCLUDES) -I. -DSOCKLEN_T=socklen_t -D_LARGEFILE_SOURCE=1 $CFLAGS -fPIC |g" config.linux
  ./genMakefiles linux
  make || return 1

  for dir in BasicUsageEnvironment UsageEnvironment groupsock liveMedia; do
    mkdir -p $startdir/pkg/usr/lib/live-media/$dir
    cp -r $dir/*.a $dir/include $startdir/pkg/usr/lib/live-media/$dir
  done

  mkdir -p $startdir/pkg/usr/bin
  for testprog in `find testProgs -type f -perm 755`; do
    install $testprog $startdir/pkg/usr/bin
  done
}

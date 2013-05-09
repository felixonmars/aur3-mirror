pkgname=x264rip-tmod-git
#x264_rev2323 + l-smash_rev704
pkgver=20130507
pkgrel=1
pkgdesc="H.264/MPEG-4 AVC video encoder for both 8 and 10 bit output with lavf import, audio encoder and muxer"
arch=('i686' 'x86_64')
url="https://astrataro.wordpress.com/"
license=('GPL')
depends=('glibc' 'libav')
optdepends=('avxsynth-git' 'vapoursynth')
makedepends=('git' 'yasm')

_gitroot="git://github.com/astrataro/x264_tMod.git"
_gitname="x264_tMod"
#OpenCL support is only well tested on Windows/MinGW.
buildparams="--enable-nonfree --disable-opencl --disable-interlaced"

build() {
  # custom cflags like lto or march/mtune may even slow down the x264 encoder
  unset CFLAGS

  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname --branch tMod
  fi
  msg "GIT checkout done or server timeout"

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build --branch tMod

  cd $srcdir/$_gitname-build

  chmod +x configure version.sh
  ./configure $buildparams --bit-depth=10
  #make fprofiled VIDS=sample10.mkv
  make
  install -Dm755 x264 $pkgdir/usr/bin/x264-10bit
  ./configure $buildparams
  #make fprofiled VIDS=sample8.mkv
  make
  install -m755 x264 $pkgdir/usr/bin/x264-8bit
}

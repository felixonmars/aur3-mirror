# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=mingw32-flac
pkgver=20120404
pkgrel=1
pkgdesc="Free Lossless Audio Codec"
arch=('i686' 'x86_64')
url="http://flac.sourceforge.net/"
license=('custom:Xiph' 'LGPL' 'GPL' 'FDL')
depends=('mingw32-libogg')
makedepends=('git' 'nasm' 'mingw32-gcc' 'mingw32-binutils' 'mingw32-w32api')
options=(!libtool !strip !buildflags)
source=()
md5sums=()

_gitroot="git://git.xiph.org/flac.git"
_gitname="flac"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
    cd $_gitname && git checkout ew && cd ..
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  unset LDFLAGS
  touch config.rpath
  ./autogen.sh
  ./configure --enable-shared --enable-static --disable-xmms-plugin --disable-sse --disable-rpath --prefix=/usr/i486-mingw32 --host=i486-mingw32 --disable-asm-optimizations --with-pic
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install
  rm -r $pkgdir/usr/i486-mingw32/share/doc/
  rm -r $pkgdir/usr/i486-mingw32/share/man/
} 

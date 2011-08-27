# Contributor: Nils Gey <list@nilsgey.de>
# Author: Thorben Hohn
# Contributor: John Regan <saxindustries@gmail.com>

_pkgbasename=libflashsupport-jack
pkgname=lib32-$_pkgbasename
pkgver=20110801
pkgrel=1
pkgdesc="JACK-audio-connection-kit support for Flash"
arch=('x86_64')
url="http://sourceforge.net/users/torbenh/"
license=('GPL')
makedepends=('git' 'gcc-multilib')
depends=('lib32-openssl' 'lib32-libsamplerate' 'lib32-jack')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://repo.or.cz/libflashsupport-jack.git"
_gitname="libflashsupport-jack"

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
 ./bootstrap.sh
 ./configure --prefix=/usr --libdir=/usr/lib32
 sed -i 's|#define V4L1|//#define V4L1|' ./flashsupport.c || return 1
  make || return 1
 make DESTDIR=${pkgdir} install || return 1
} 

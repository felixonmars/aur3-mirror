pkgname=despotify-pulse-svn
pkgver=r521
pkgrel=1
pkgdesc="An open source client for Spotify whit pulseaudio"
arch=('i686' 'x86_64')
url="http://despotify.sourceforge.net/"
license=('GPL2')
depends=('libvorbis' 'openssl' 'pulseaudio' 'libao')
makedepends=('subversion')
provides=('despotify-svn')
conflicts=('despotify-svn' 'despotify-ao-svn')
source=(despotify::svn+https://despotify.svn.sourceforge.net/svnroot/despotify/src)
md5sums=('SKIP')

pkgver() {
  cd "despotify"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/despotify"

  sed 's:gstreamer:pulseaudio:' <Makefile.local.mk.dist > Makefile.local.mk
  
  make
}

package() {
  cd "$srcdir/despotify"
  
  # The installer fails to make these directories

  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/bin"

  # Install to the pkgdir
  
  make INSTALL_PREFIX="$pkgdir/usr" DESTDIR="$pkgdir/" install

  # Shouldn't be executable, fixing
  chmod -x "$pkgdir/usr/include/despotify.h"
}


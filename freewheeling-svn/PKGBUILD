# Maintainer: renato budinich - rennabh AT gmail DOT com
pkgname=freewheeling-svn
pkgver=100
pkgrel=1
pkgdesc="Freewheeling is a new way to be In The Muse-ical Moment. It's a live looping instrument that returns us to the joy of making music spontaneously. svn version"
arch=('x86_64' 'i686')
url="http://freewheeling.sourceforge.net"
license=('GPL')
depends=('libxml2' 'sdl_ttf' 'fluidsynth' 'sdl_gfx' 'libvorbis' 'gnutls' 'libsm')
makedepends=('subversion')
conflicts=('freewheeling')

_svntrunk=http://freewheeling.svn.sourceforge.net/svnroot/freewheeling
_svnmod=freewheeling

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  aclocal
  autoconf
  autoheader || return 0 &
  automake -a
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

pkgname=invertika-svn
pkgver=2291
pkgrel=1
pkgdesc="A german MMORPG based on the Manasource plattform"
arch=('any')
url="http://invertika.org/"
license=('GPL2')
makedepends=('subversion' 'cmake')
depends=('guichan' 'curl' 'physfs' 'libpng' 'libpthread-stubs' 'sdl_image' 'sdl_mixer' 'sdl_net' 'sdl_ttf' 'sdl_gfx' 'libxml2' 'zlib' 'libtool' 'enet-old' 'gettext')
provides=('invertika')
conflicts=('mana')
_svntrunk="http://invertika.googlecode.com/svn/tags/1879-semistable-client-server/client"
_svnmod=invertika-client

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co "$_svntrunk" --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr"
  make
  make DESTDIR="$pkgdir/" install
}

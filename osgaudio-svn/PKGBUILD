# Maintainer: Marius Dransfeld <marius.dransfeld@googlemail.com>

pkgname=osgaudio-svn
pkgver=84
pkgrel=1
pkgdesc="osgAudio is an OpenSceneGraph nodekit that wraps OpenAL and FMOD to enable sound toolkits in OSG"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osgaudio/"
license=('LGPL')
depends=('openscenegraph' 'freealut')
makedepends=('subversion' 'cmake')
provides=(osgaudio)
conflicts=(osgaudio)

_svntrunk=http://osgaudio.googlecode.com/svn/trunk/
_svnmod=osgaudio

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
  cmake . -DCMAKE_BUILD_TYPE=Release  -DCMAKE_INSTALL_PREFIX=/usr -D0_ENABLE_SUBSYSTEM_OPENAL=TRUE -D0_ENABLE_SUBSYSTEM_FMOD=FALSE

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

pkgname=libao-svn
pkgver=HEAD
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc="Cross-platform audio output library and plugins"
url="http://www.xiph.org/ao"
license=('GPL')
depends=('alsa-lib')
makedepends=('subversion')
provides=('libao=1.1.0')
conflicts=('libao')

_svntrunk=http://svn.xiph.org/trunk/ao
_svnmod=libao

build() {
  msg "Hi"
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

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1

  rm -rf "$srcdir/$_svnmod-build"
}


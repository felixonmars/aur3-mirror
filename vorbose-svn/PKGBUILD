# Contributor: Anders Bergh <anders1@gmail.com>
pkgname=vorbose-svn
pkgver=16184
pkgrel=1
pkgdesc="Vorbis I header/stream information dump tool"
arch=(i686 x86_64)
url="http://www.xiph.org"
license=('GPL')
depends=('libogg2')
makedepends=('subversion')
provides=('vorbose')
conflicts=('vorbose')
source=()
md5sums=()

_svntrunk=http://svn.xiph.org/trunk/vorbose
_svnmod=vorbose

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
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  aclocal || exit 1
  autoheader || exit 1
  automake --add-missing || exit 1
  autoconf || exit 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

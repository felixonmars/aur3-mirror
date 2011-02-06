# Contributor: Anders Bergh <anders1@gmail.com>
pkgname=libogg2-svn
pkgver=14420
pkgrel=1
pkgdesc="Ogg bitstream and framing library, version 2 - svn"
arch=(i686 x86_64)
url="http://www.xiph.org"
license=('BSD')
makedepends=('subversion')
provides=('libogg2')
conflicts=('libogg2')
source=()
md5sums=()

_svntrunk=http://svn.xiph.org/trunk/ogg2
_svnmod=ogg2

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
  libtoolize --automake || exit 1
  automake --add-missing || exit 1
  autoconf || exit 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# Contributor: Kosyak <ObKo@mail.ru>
pkgname=psdparse
pkgver=3.6f1
pkgrel=1
pkgdesc="PSD/PSB Parser Utility"
arch=('i686' 'x86_64')
url="http://www.telegraphics.com.au/sw/product/psdparse"
license="GPL"
depends=(zlib libpng)
makedepends=(make gcc automake subversion)
provides=(psdparse)

_svnrepo="http://telegraphics.com.au/svn/psdparse/tags/release-3.6f1/"
_svndir=psdparse

build() {
  cd "$srcdir"

  if [ -d $_svndir/.svn ]; then
    (cd $_svndir && svn up)
  else
    svn co $_svnrepo --config-dir ./ $_svndir
  fi

  rm -rf "$srcdir/$_svndir-build"
  cp -r "$srcdir/$_svndir" "$srcdir/$_svndir-build"
  cd "$srcdir/$_svndir-build"

  sed -i 's/psdparse_LDFLAGS = $(LIBPNG_LIBS)/psdparse_LDFLAGS = $(LIBPNG_LIBS) -lz/g' Makefile.am
  aclocal
  automake -a -f --foreign
  ./configure --prefix=$pkgdir/usr
  make

  make
}

package() {
  cd "$srcdir/$_svndir-build/"
  make install
}
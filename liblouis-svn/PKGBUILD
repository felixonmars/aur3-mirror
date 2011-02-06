# Contributor: Zachary Kline <kline.zachary@gmail.com>
pkgname=liblouis-svn
pkgver=318
pkgrel=1
pkgdesc="A Braille translation and back-translation library"
arch=('i686')
url="http://liblouis.googlecode.com"
license=('LGPL')
groups=()
depends=('brltty')
makedepends=('subversion' 'automake' 'autoconf')

_svntrunk=http://liblouis.googlecode.com/svn/trunk/
_svnmod=liblouis

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

  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr --enable-ucs4
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Alf <naihe2010@126.com>
pkgname=libpurple-microblog-sina
pkgver=32
pkgrel=1
pkgdesc="sina microblog plugin for libpurple"
arch=('i686')
url="http://code.google.com/p/libpurple-microblog-sina/"
license=('GPL v3')
groups=()
depends=('pidgin' 'libpurple')
makedepends=('subversion')
provides=()
options=()
install=
source=()
noextract=()
_svntrunk=http://libpurple-microblog-sina.googlecode.com/svn/trunk/
_svnmod=build
md5sums=()

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  autoreconf -fi
  ./configure
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

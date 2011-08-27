# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=bsl
pkgname=$_pkg-svn
pkgver=3467
pkgrel=1
pkgdesc="Buzztard song loader"
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('buzztard-svn')
makedepends=('subversion')
provides=("$_pkg")
conflicts=("$_pkg")
options=('!libtool')
install="$pkgname.install"

_svntrunk="https://buzztard.svn.sourceforge.net/svnroot/buzztard/trunk/$_pkg"
_svnmod="$_pkg"

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

  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no

  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir/" install

  # Deleting unneeded files
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  find "$pkgdir/usr/share/mime" -maxdepth 1 -type f -exec rm {} \;
}

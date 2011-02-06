# Contributor: vogo <vogo@seznam.cz>
pkgname=gshutdown-svn
pkgver=634
pkgrel=1
pkgdesc="An advanced shutdown utility"
arch=('i686' 'x86_64')
url="http://gshutdown.tuxfamily.org"
license=('GPL')
depends=('libglade' 'libnotify')
makedepends=('subversion' 'pkgconfig')
provides=('gshutdown')
conflicts=('gshutdown')

_svntrunk="svn://svn.tuxfamily.org/svnroot/gshutdown/gshutdown"
_svnmod="gshutdown"

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

  cd po/
  ./update_po
  make
  make
  cd ..

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

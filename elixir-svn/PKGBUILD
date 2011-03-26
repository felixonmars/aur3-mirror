# $Id: PKGBUILD 14587 2010-04-05 16:45:30Z rvanharen $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=elixir-svn
pkgver=49609
pkgrel=1
pkgdesc="A JavaScript binding for the EFL used on french set top box."
arch=('i686' 'x86_64')
groups=('e17-libs-svn' 'e17-svn')
url="http://www.enlightenment.org"
license=('BSD')
depends=('ecore-svn' 'edje-svn' 'eet-svn' 'evas-svn' 'spidermonkey' 'sqlite3' 'zlib' 'libgcrypt' 'sdl_mixer')
makedepends=('svn')
conflicts=('elixir')
provides=('elixir')
options=('!libtool')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/javascript/elixir"
_svnmod="elixir"

build() {
   cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING \
  	$pkgdir/usr/share/licenses/$pkgname/COPYING
  
  install -Dm644 $srcdir/$_svnmod-build/COPYING-PLAIN \
  	$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN
      
  rm -r $srcdir/$_svnmod-build
}

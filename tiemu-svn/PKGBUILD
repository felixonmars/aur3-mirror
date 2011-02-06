# Contributor: r4 <dru84532 (at) gmail.com>

_pkgname=tiemu
pkgname=$_pkgname-svn
pkgver=2854
pkgrel=1
pkgdesc="TiEmu emulates Texas Instruments calculators TI-89/92/92+/V200PLT (no GDB)."
arch=(i686 x86_64)
url="http://tilp.info/"
license=('GPL')
depends=('libglade' 'libticalcs-svn' 'sdl')
makedepends=('subversion')
options=('force' '!libtool')
provides=(tiemu)
conflicts=(tiemu)

_svnmod=$_pkgname
_svntrunk=http://svn.tilp.info/repos/tiemu/$_svnmod/trunk

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
  ./configure --prefix=/usr --disable-gdb
  make || return 1
  make DESTDIR="$pkgdir/" install
}

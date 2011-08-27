# Contributor: Jon Sturm <Jasturm002@aol.com>
_pkgname=libticables
pkgname=$_pkgname-svn
pkgver=4294
pkgrel=1
pkgdesc="TI link cable library"
arch=(i686 x86_64)
url="http://tilp.info/"
license=('GPL')
depends=('glib2')
makedepends=('subversion')
provides=(libticables libticables2)
conflicts=(libticables libticables2)
options=('force' '!libtool')
source=(69-libticables.rules)

_svnmod=$_pkgname
_svntrunk=http://svn.tilp.info/repos/tilp/$_svnmod/trunk

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
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -m755 -d ${pkgdir}/etc/udev/rules.d
  install -m644 ${srcdir}/69-libticables.rules ${pkgdir}/etc/udev/rules.d/

}

md5sums=('ed8dd523e68a9414aae078a1604005f7')

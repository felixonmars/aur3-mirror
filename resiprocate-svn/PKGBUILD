pkgname=resiprocate-svn
pkgver=8628
pkgrel=1
pkgdesc="is dedicated to maintaining a complete, correct, and commercially usable implementation of SIP and a few related protocols"
arch=(i686 x86_64)
url="http://www.resiprocate.org"
license=('GPL')
depends=()
makedepends=()
optdepends=()

_svntrunk=https://svn.resiprocate.org/rep/resiprocate/main
_svnmod=resiprocate

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
#  ./configure -y --with-compile-type=opt \
#	--enable-shared-libs \
#	--enable-ssl \
#	--disable-ipv6 \
#	--prefix=/usr --ares-prefix=/usr
  make resiprocate || return 1
  make DESTDIR=$pkgdir/ INSTALL_PREFIX=/usr install-rutil install-resip && \
  make DESTDIR=$pkgdir/ ARES_PREFIX=/usr install-ares || return 1

  mv $pkgdir/ares $pkgdir/usr/include/
}

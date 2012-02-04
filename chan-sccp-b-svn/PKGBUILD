# Maintainer: Rob Dailey <rob at virtualaddiction dot net>
pkgname=chan-sccp-b-svn
pkgver=2818
pkgrel=1
pkgdesc="Skinny Control Client Protocol (SCCP) channel driver for Asterisk"
arch=('i686')
url="http://chan-sccp-b.sourceforge.net/"
license=('GPL')
depends=(libtool)
makedepends=()

_svntrunk=https://chan-sccp-b.svn.sourceforge.net/svnroot/chan-sccp-b/trunk
_svnmod=chan-sccp-b

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

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install

  install -D conf/sccp.conf "$pkgdir/etc/asterisk/sccp.conf.default"
  install -D conf/sccp_simple.conf "$pkgdir/etc/asterisk/sccp_simple.conf.default"
  install -D conf/sccp_short.conf "$pkgdir/etc/asterisk/sccp_short.conf.default"
}

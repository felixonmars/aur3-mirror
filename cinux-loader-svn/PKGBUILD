# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=cinux-loader-svn
pkgver=51
pkgrel=1
pkgdesc="A little program to download files from one-click hosting sites written in C "
url="http://cinux-loader.sourceforge.net"
license=(GPL3)
arch=(x86_64 i686)
depends=('curl' 'openssl' 'pcre' 'imagemagick' 'gocr')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=http://cinux-loader.svn.sourceforge.net/svnroot/cinux-loader/trunk/unstable
_svnmod=cinux-loader

build() {

  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./configure --sysconfdir=$pkgdir/etc --prefix=$pkgdir/usr
  make || return 1
  make install || return 1

}

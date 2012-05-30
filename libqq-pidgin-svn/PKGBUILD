# Contributor: Havanna <havanna.sha{at}gmail{dot}com>

pkgname=libqq-pidgin-svn
pkgver=195
pkgrel=1
arch=('i686' 'x86_64')
url="http://code.google.com/p/libqq-pidgin/"
pkgdesc="Latest QQ 2010 protocol for pidgin"
license=('GPLv3')
depends=('libpurple' 'pidgin')
makedepends=('libpurple' 'autoconf')
conflicts=('libqq-pidgin' 'libqq')
provides=('libqq-pidgin' 'libqq')
options=('!libtool')

_svntrunk=http://libqq-pidgin.googlecode.com/svn/trunk/
_svnmod=libqq-pidgin

build() {
  cd $srcdir/
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver && cd ..)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build

  msg "Starting make..."
  cd $_svnmod-build
  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}
package(){
  cd $_svnmod-build
  make DESTDIR="$pkgdir" install
}

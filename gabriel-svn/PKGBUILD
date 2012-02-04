# Contributor: IpDataTel, Inc. <matt@ipdatatel.com>

pkgname=gabriel-svn
pkgver=38
pkgrel=1
pkgdesc="Gabriel is a simple client-server software that allows applications to create remote D-Bus connections over SSH."
url="http://gabriel.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libssh' 'glib2' 'socat' 'dbus')
makedepends=('subversion')
conflicts=('gabriel')
provides=('gabriel')
source=(gabriel-svn.patch)
md5sums=('cb6bdaca0ca9c1278205a008024f18de')

_svntrunk=https://gabriel.svn.sourceforge.net/svnroot/gabriel/gabriel
_svnmod=gabriel

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  ./autogen.sh

  patch -Np0 -i ${srcdir}/gabriel-svn.patch

  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_svnmod-build
}

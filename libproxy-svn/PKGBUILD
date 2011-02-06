# Maintainer: Will Chappell <mr.chapendi@gmail.com>

pkgname=libproxy-svn
pkgver=401
pkgrel=1
pkgdesc="A library that provides automatic proxy configuration management"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('dbus-core')
makedepends=('subversion')
provides=('libproxy')
url="http://libproxy.googlecode.com"
source=()
conflicts=('libproxy')
md5sums=()
options=('!libtool' '!emptydirs')

_svntrunk=http://libproxy.googlecode.com/svn/trunk/
_svnmod=libproxy-read-only

build() {
  # Check out from svn.
  cd "${srcdir}"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  # Actual build.
  cd $_svnmod
  ./autogen.sh
  ./configure --prefix=/usr --without-mozjs || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}

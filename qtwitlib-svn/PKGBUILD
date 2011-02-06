# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=qtwitlib-svn
pkgver=67
pkgrel=1
pkgdesc="C++ Library for the twitter.com API"
arch=('i686' 'x86_64') 
url="http://code.google.com/p/twitlib/"
license=('GPL3')
conflicts=('qtwitlib')
provides=('qtwitlib')
depends=('qt>=4.4.0')
makedepends=('subversion')
source=()
md5sum=()

_svntrunk=http://twitlib.googlecode.com/svn/trunk/
_svnmod=$pkgname

build()
{
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  cd $_svnmod

  qmake -unix PREFIX=/usr -o Makefile twitlib.pro || return 1
  make \
    CFLAGS="-pipe ${CFLAGS} -Wall -W -D_REENTRANT -fPIC \$(DEFINES)" \
    CXXFLAGS="-pipe ${CXXFLAGS} -Wall -W -D_REENTRANT -fPIC \$(DEFINES)" || return 1

  # Install the library and header files.
  install -d -m 0755 ${pkgdir}/usr/{lib,include/qtwitlib} || return 1
  install -m 0644 include/*.h ${pkgdir}/usr/include/qtwitlib || return 1
  install -m 0755 release/libQTwitLib.so.1.0.0 ${pkgdir}/usr/lib || return 1
  # Create symlinks.
  (cd ${pkgdir}/usr/lib ; ln -s libQTwitLib.so.1.0.0 libQTwitLib.so.1.0)
  (cd ${pkgdir}/usr/lib ; ln -s libQTwitLib.so.1.0.0 libQTwitLib.so.1)
  (cd ${pkgdir}/usr/lib ; ln -s libQTwitLib.so.1.0.0 libQTwitLib.so)
}

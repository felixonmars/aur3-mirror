# Packer: <csgeek@esamir.com> 

pkgname=twitlib-svn
pkgver=69
pkgrel=1
pkgdesc="Twitlib C++ Library."
arch=('i686' 'x86_64')
license=('GPL')
url="http://code.google.com/p/twitlib/"
depends=('qt' )
makedepends=('svn')
optdepends=()
options=()
provides=('twitlib')
conflicts=('twitlib')
source=()
md5sums=()
_svntrunk=http://twitlib.googlecode.com/svn/trunk
_svnmod=twitlib

build() 
{
svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
     cd ${srcdir}/$_svnmod
  qmake 
  make || return 1
  echo "${pkgdir}"
  install -d "${pkgdir}/usr/lib"
  install -m655 ${srcdir}/$_svnmod/release/libQTwitLib.so ${pkgdir}/usr/lib

}


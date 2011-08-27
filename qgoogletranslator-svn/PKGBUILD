#Maintainer karnath <karnathtorjian@gmail.com>

pkgname=qgoogletranslator-svn
pkgver=186
pkgrel=1
pkgdesc="Translates text via Google Translate engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qgt"
license=('GPL3')
conflicts=("qgoogletranslator" "qgoogletranslator-svn") 
provides=("qgoogletranslator-svn" "qgoogletranslator")
depends=('qt>=4.6.0')
makedepends=('make' 'cmake' 'subversion')

_svntrunk="http://qgt.googlecode.com/svn/trunk/"
_svnmod="qgt"

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  cmake . -DCMAKE_INSTALL_PREFIX=/usr  || return 1
  make || return 1
 
  
}

package() {
 cd $srcdir/$_svnmod
 make DESTDIR=$pkgdir install || return 1
}



# Contributor: Toren Correnos <correnos@gmail.com>

pkgname=kopete-xfire-svn
pkgver=74
pkgrel=1
pkgdesc="Xfire protocol support for Kopete - svn version"
url="http://code.google.com/p/kopete-xfire"
license=('GPL')
arch=('any')
depends=('kdenetwork-kopete') 
makedepends=('subversion' 'cmake' 'automoc4')
provides=('kopete-xfire')
conflicts=('kopete-xfire')

_svntrunk='http://kopete-xfire.googlecode.com/svn/'
_svnmod='kopete'

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg2 "SVN checkout done or server timeout"
  
  mkdir $_svnmod/trunk/build
  cd $_svnmod/trunk/build
  cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod/trunk/build"
  make DESTDIR="$pkgdir" install
}

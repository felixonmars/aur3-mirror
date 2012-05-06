
 # Contributor: Kevin Whitaker <eyecreate at gmail dot com>

pkgname=ticpp-svn
pkgver=124
pkgrel=1
pkgdesc="TinyXML for c++"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ticpp/"
license=('MIT')
depends=()
makedepends=('subversion' 'premake')
source=()
md5sums=()

_svntrunk=http://ticpp.googlecode.com/svn/trunk/
_svnmod=ticpp


build() {
  cd $srcdir  
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  cd $_svnmod
  premake4 gmake
  make
}  

package(){
  mkdir -p $pkgdir/usr/include/ticpp $pkgdir/usr/lib
  cp $srcdir/ticpp/lib/libticppd.a $pkgdir/usr/lib/libticppd.a
  cp $srcdir/ticpp/*.h $pkgdir/usr/include/ticpp
  cd $pkgdir/usr/lib/
  ln -s libticppd.a libticpp.a
}
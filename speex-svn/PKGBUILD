# Maintainer: Philipp Gildein <rmbl@openspeak-project.org>

pkgname=speex-svn
pkgver=14893
pkgrel=1
pkgdesc="A free codec for free speech"
arch=('i686')
license=('BSD')
provides=('speex')
conflicts=('speex')
depends=('libogg')
makedepends=('subversion' 'autoconf' 'automake')
url="http://www.speex.org/"
source=()
md5sums=()

_svntrunk=http://svn.xiph.org/trunk
_svnmod=speex

build() {
   cd $startdir/src/

   if [ -d $_svnmod/.svn ]; then
	   echo "Directory is already existing - Updating"
	   (cd $_svnmod && svn update)
   else
	   echo "Checking out from SVN"
	   svn co $_svntrunk/$_svnmod --config-dir ./ -r $pkgver $_svnmod
   fi

   cd $_svnmod
   ./autogen.sh
   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
   make || return 1
   make DESTDIR=$startdir/pkg install
   #to fix kde detection
   cp $startdir/pkg/usr/include/speex/* $startdir/pkg/usr/include/
   #libtoolslay
   find $startdir/pkg -name '*.la' -exec rm {} \;
}

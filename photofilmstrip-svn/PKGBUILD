# Contributor: W. Kyle <kyle_white@hotmail.com>
pkgname=photofilmstrip-svn
pkgver=189
pkgrel=1
pkgdesc="Creates movies out of pictures using a Ken Burns effect. From SVN."
arch=('i686' 'x86_64')
url="http://www.photofilmstrip.org"
license=('GPL')
conflicts=('photofilmstrip')
provides=('photofilmstrip')
depends=('wxpython' 'pil')
makedepends=('svn')
source=()
md5sums=('')

_svntrunk="https://photostoryx.svn.sourceforge.net/svnroot/photostoryx/trunk/"
_svnmod="photofilmstrip"

build() {
 cd $srcdir

msg "Connecting to $_svntrunk SVN server...."
if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && svn up)
else
   svn co $_svntrunk $_svnmod
fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod/

  make compile
  DESTDIR="$pkgdir" make install
  mkdir -p $pkgdir/usr/share/doc
  cp -R $srcdir/photofilmstrip/doc/photofilmstrip $pkgdir/usr/share/doc/photofilmstrip
  chmod o+rx $pkgdir/usr/bin/photofilmstrip-cli
  chmod o+rx $pkgdir/usr/bin/photofilmstrip
} 

#Maintainer: Pietro Bonfa' <bonfus ( at ) gmail.com>
 
pkgname=gdis-cvs
pkgver=20130319 
pkgrel=1
pkgdesc="GDIS is a scientific visualization program for the display, manipulation, and analysis of isolated molecules and periodic structures."
arch=('i686' 'x86_64')
url="http://gdis.sourceforge.net/"
license=('GPL')
provides=('gdis')
conflicts=('gdis')
depends=('gtk2' 'gtkglext' 'libpng')
options=('!libtool')
makedepends=('cvs' 'perl')
source=('makefile' 'gdis.sh')
md5sums=('75672b1f8aab349a12dcc8bd257e8722'
         'da4688d3dc2b96ee5ec3c4bae23a00e2')

_cvsroot=":pserver:anonymous@gdis.cvs.sourceforge.net:/cvsroot/gdis"
_cvsmod="gdis"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cp "$srcdir/makefile" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  
  sed -i 's/png14/png15/g' makefile

  make


  install -D -m 0755  gdis "$pkgdir/opt/gdis/gdis"  
  install -D -m 0644  gdis.elements "$pkgdir/opt/gdis/gdis.elements"
  install -D -m 0644  gdis.library "$pkgdir/opt/gdis/gdis.library"
  install -D -m 0644  gdis.manual "$pkgdir/opt/gdis/gdis.manual"
    
  install -D -m 0755 "$srcdir/gdis.sh" "$pkgdir/usr/bin/gdis"
}

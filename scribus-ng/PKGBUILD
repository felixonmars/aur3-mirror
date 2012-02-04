# Maintainer: John Haltiwanger <john.haltiwanger@gmail.com> 

pkgname=scribus-ng
pkgver=1.4.0rc3
pkgrel=1
pkgdesc="A desktop publishing program - 'NG' 1.4.0 release candidate"
arch=(i686 x86_64)
license=('GPL')
url="http://www.scribus.net"
install=${pkgname}.install
depends=('libcups>=1.2.10'       \
         'lcms>=1.17'            \
         'qt>=4.3.0'             \
         'ghostscript>=8.60'     \
         'libart-lgpl>=2.3.19'   \
         'python2>=2.5'          \
       	 'libxml2>=2.6.27'       \
         'cairo'                 \
         'desktop-file-utils'    \
         'freetype2>=2.3.0'      \
         'libtiff>=3.6.0'        \
         'libjpeg'               \
         'pixman>=0.15.16'       \
         )

makedepends=('subversion' 'cmake' 'gcc>=4.0' 'make')
# options=(!libtool force !makeflags)
replaces=('scribus-devel')
provides=('scribus')
source=(${pkgname}.desktop)
md5sums=('e127bbe5f9e67c401f4094f1e99221d0')

_svntrunk='svn://scribus.net/branches/Version135'
_svnmod='Scribus'

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
	  (cd $_svnmod && svn up -r $pkgver)
  else
	  svn co $_svntrunk --config-dir ./ $_svnmod -r $pkgver
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  rm -rf $srcdir/$_svnmod-build
  mkdir $_svnmod-build
  cd $_svnmod-build

#  cmake ../$_svnmod/Scribus -DCMAKE_INSTALL_PREFIX:PATH=/opt/scribus/ -DWANT_SYSTEM_CAIRO=1
  cmake ../$_svnmod/Scribus -DCMAKE_INSTALL_PREFIX:PATH=/opt/scribus/ -DWANT_PRIVATE_CAIRO=1
  
  sed -i 's|-Wl,--as-needed||' $srcdir/$_svnmod-build/scribus/CMakeFiles/scribus.dir/link.txt
   
  make
  make DESTDIR=$pkgdir install

  install -Dm644 $startdir/scribus-ng.desktop  $pkgdir/usr/share/applications/scribus-ng.desktop
}



# Maintainer: Jens Staal <staal1978@gmail.com

pkgname=opencflite-svn
_realname=opencflite
pkgver=248
pkgrel=2
pkgdesc="A cross platform toolkit for building applications on Mac OS X, Windows, and Linux."
url="http://sourceforge.net/projects/opencflite/"
arch=('i686' 'x86_64')
license=('APPLE')
depends=('icu' 'util-linux')
makedepends=('subversion' 'clang')
provides=('opencflite')
options=(!emptydirs)

source=('configh.patch' 'conditionalmacrosh.patch')
md5sums=('dc461b49a9336c45886e7308ea27d2dd' 'a471d36f7c40b6e3fd33403d0921e4a6')

_svntrunk=https://opencflite.svn.sourceforge.net/svnroot/opencflite/trunk
_svnmod=${_realname}

build() {

  cd ${srcdir}

  if [ -d $_svnmod ] ; then
    (cd $_svnmod && svn update)
    msg "The local files are updated."
  else
    svn co ${_svntrunk} ${_svnmod}
  fi

  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/$_svnmod $srcdir/build
  cd $srcdir/build
  ln -s /usr/include/time.h tzfile.h # configure needs this file...
  
  
  ./configure --prefix=/usr --with-uuid-libs=/usr/lib --with-tz-default=/etc/localtime --with-tz-data=/usr/share/zoneinfo --with-tz-includes=$srcdir/build
  
  patch -p0 $srcdir/build/include/config.h -i $startdir/configh.patch
  patch -p0 $srcdir/build/include/ConditionalMacros.h -i $startdir/conditionalmacrosh.patch
  #trying to out-smart some annoying header issues...
  make
}
 
package() {
  cd $srcdir/build
  make DESTDIR=${pkgdir} install
  mkdir -p $pkgdir/usr/share/licenses/opencflite
  install -m644 $srcdir/build/APPLE_LICENSE $pkgdir/usr/share/licenses/opencflite/
  install -m644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/opencflite/
}
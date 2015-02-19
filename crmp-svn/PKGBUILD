# Maintainer: Philipp pba3h11aso <philsch@hotmail.de>
pkgname=crmp-svn
pkgver=61
pkgrel=3
pkgdesc="Classic Ramona Audio Player"
arch=(i686 x86_64)
url="http://code.google.com/p/crmp/"
license="MPL"
depends=('fmodex' 'qt5-base' 'subversion' 'gcc' 'cmake' )
provides=('crmp')
conflicts=('crmp' 'crmp-bin')

_svntrunk=http://crmp.googlecode.com/svn/trunk/
_svnmod=crmp

build() 
{
  

  if [ "$CARCH" = "x86_64" ]; then
    SPEC=linux-g++
  elif [ "$CARCH" = "i686" ]; then
    SPEC=linux-g++-32
  fi

  
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && svn up -r $pkgver)
 else
   svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  
  #region BUILD CRMP
  cd $_svnmod/
  mkdir build
  cd build
  
  msg2 "Build main programm ..."
  qmake-qt5 ../crmp.pro -r -spec $SPEC
  make -j4 
 
  #endregion
  
  #region make dsp_normalize
  cd $startdir/src/crmp/dsp/dsp_normalize
  mkdir build
  cd build
  
  msg2 "Build dsp_normalize ..."
  qmake-qt5 ../dsp_normalize.pro -r -spec $SPEC
  make -j4

  #endregion
  
  #region make dsp_parameq
  cd $startdir/src/crmp/dsp/dsp_parameq
  mkdir build
  cd build
  msg2 "Buils dsp_parameq ..."
  qmake-qt5 ../dsp_parameq.pro -r -spec $SPEC
  make -j4

  #endregion
}
package()
{
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/crmp/
  mkdir -p $pkgdir/usr/share/icons/crmp/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/etc/

  install -Dm755 $startdir/src/$_svnmod/build/crmp $pkgdir/usr/bin/
  install -Dm755 $startdir/src/$_svnmod/dsp/dsp_normalize/build/libdsp_normalize.so.1.0.0 $pkgdir/usr/share/crmp/dsp_normalize.dsp
  install -Dm755 $startdir/src/$_svnmod/dsp/dsp_parameq/build/libdsp_parameq.so.1.0.0 $pkgdir/usr/share/crmp/dsp_parameq.dsp


  install -Dm755 $startdir/src/$_svnmod/unix/crmp.xml $pkgdir/etc/crmp.xml
  install -Dm644 $startdir/src/$_svnmod/icons/media_player.png $pkgdir/usr/share/icons/crmp/application_crmp.png
  install -Dm644 $startdir/src/$_svnmod/unix/crmp.desktop $pkgdir/usr/share/applications/crmp.desktop

  msg "Sound config in file '/etc/crmp.xml'"
}

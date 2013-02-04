#Maintainer: <fero dot kiraly at gmail.com>

pkgname=algoscore
pkgver=20121101
pkgrel=1
pkgdesc="a graphical environment for algorithmic composition, where music is constructed directly in an interactive graphical score"
url="http://kymatica.com/Software/AlgoScore"
arch=('i686' 'x86_64' )
license=('GPL3')
depends=('csound5' 'gtk2' 'jack' )
optdepends=('liblo: for OSC support')
makedepends=('cmake')
backup=()
options=('!makeflags')
source=('algoscore.desktop' 'algoscore.c.patch' 'algoscore-driver.patch')
md5sums=('b8c957bed82fd9318f24212bedd101ed' '2e29f1018813d9a26cebea47e6d27d2d' '5959f147b63b58f8e851243c09eb18e8')




build() {

 
  #
  #downloading pd-extended----------------------------------------------------------
  #
  msg "Begin SVN checkout for algoscores" 
  cd $srcdir
  svn co http://svn.gna.org/svn/algoscore/trunk $pkgname

  msg "SVN checkout done or server timeout"

 
 
  patch -N -i ${srcdir}/algoscore.c.patch "$srcdir/$pkgname/src/algoscore.c"
  patch -N -i ${srcdir}/algoscore-driver.patch "$srcdir/$pkgname/lib/algoscore-driver.nas"

  #MAKE --------------------------------------------------------------------------
  
  cd "$srcdir/$pkgname/src/"
  mkdir build
  cd build 
  cmake .. -DCMAKE_EXE_LINKER_FLAGS="-lm" -DCMAKE_PREFIX_PATH=/ -DCMAKE_LIBRARY_PATH=/usr/lib 
 
  make prefix=/usr   || return 1
  


  
}


package() {
  cd "$srcdir/$pkgname"
  
  install -d $pkgdir/usr/lib/${pkgname}/
  install -d $pkgdir/usr/lib/${pkgname}/examples
  install -d $pkgdir/usr/lib/${pkgname}/Help
  install -d $pkgdir/usr/lib/${pkgname}/classes
  install -d $pkgdir/usr/lib/${pkgname}/lib
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -d $pkgdir/usr/share/applications


  cp -r lib/* ${pkgdir}/usr/lib/${pkgname}/lib
  cp -r examples/* ${pkgdir}/usr/lib/${pkgname}/examples
  cp -r Help/* ${pkgdir}/usr/lib/${pkgname}/Help
  cp -r classes/* ${pkgdir}/usr/lib/${pkgname}/classes
  install -m755 algoscore ${pkgdir}/usr/bin/algoscore
  install $srcdir/$pkgname/as_icon.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/algoscore.png
  install $srcdir/$pkgname/as_icon.png $pkgdir/usr/lib/${pkgname}/
  install ${srcdir}/algoscore.desktop ${pkgdir}/usr/share/applications/
  mv AppInfo.xml algoscore.xml
 # mime
  install -d $pkgdir/usr/share/mime/packages/ 
  install -p algoscore.xml $pkgdir/usr/share/mime/packages/


}

# vim:set ts=2 sw=2 et:

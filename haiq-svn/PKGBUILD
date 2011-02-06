# Contributor: Dario Andres Rodriguez <andresbajotierra@gmail.com>

pkgname=haiq-svn
pkgver=358
pkgrel=2
pkgdesc="Open Source Development Environment for Qt 4 - SVN Version"
arch=('i686' 'x86_64')
url="http://groups.google.com/group/haiq"
license=('GPL')
depends=('qt>=4.3')
conflicts=('haiq')
source=(haiq.desktop haiqpaths.h haiqmarker.cpp.patch)

_svntrunk=https://haiq.svn.sourceforge.net/svnroot/haiq
_svnmod=haiq

build() {
  
  cd $startdir/src/
  
  msg "Retrieving sources from SVN"
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  
  #Path Patchs
  cp $startdir/src/haiqpaths.h $startdir/src/haiq/src/haiqcoreinterface
  
  #GCC Patch
  patch $startdir/src/haiq/src/haiqcoreinterface/haiqmarker.cpp $startdir/src/haiqmarker.cpp.patch
  
  cd $startdir/src/haiq/
  qmake
  make || return 1
  make translation || return 1

  #Manual install
  
  mkdir -p $startdir/pkg/usr/{bin,share,lib}
  mkdir -p $startdir/pkg/usr/share/{haiq,applications,pixmaps}
  mkdir -p $startdir/pkg/usr/share/haiq/translations
  mkdir -p $startdir/pkg/usr/lib/haiq/plugins
  
  #Bin
  install -m755 $startdir/src/haiq/bin/haiq.bin $startdir/pkg/usr/bin/haiq
  install -m755 $startdir/src/haiq/bin/qmake-HaiQ $startdir/pkg/usr/bin/
  
  #Lib
  install -m644 $startdir/src/haiq/bin/libhaiqcoreinterface.so.1.0.0 $startdir/pkg/usr/lib
  
  #Libs symlinks
  ln -s /usr/lib/libhaiqcoreinterface.so.1.0.0 $startdir/pkg/usr/lib/libhaiqcoreinterface.so.1.0
  ln -s /usr/lib/libhaiqcoreinterface.so.1.0.0 $startdir/pkg/usr/lib/libhaiqcoreinterface.so.1
  ln -s /usr/lib/libhaiqcoreinterface.so.1.0.0 $startdir/pkg/usr/lib/libhaiqcoreinterface.so

  #Plugins
  install -m644 $startdir/src/haiq/plugins/* $startdir/pkg/usr/lib/haiq/plugins/
  
  #Templates
  cp -r $startdir/src/haiq/templates $startdir/pkg/usr/share/haiq/
  
  #Translations
  cp $startdir/src/haiq/translations/*.qm $startdir/pkg/usr/share/haiq/translations
  
  #Icon & .Desktop
  install -m644 $startdir/src/haiq/src/plugins/system/applicationicons/icons/HaiQIcon.png $startdir/pkg/usr/share/pixmaps/haiq.png
  install -m644 $startdir/src/haiq.desktop $startdir/pkg/usr/share/applications/

}

md5sums=('79ecfae30486f4850cd6e20e262a9160'
         '9dd429e94e427ec61e7f0b166adb96b8'
         '269baadb015e8825c496c3ae2f663c8c')

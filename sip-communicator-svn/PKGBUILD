# Contributor: atommix aka Aleks Lifey <Aleks.Lifey@gmail.com>

pkgname=sip-communicator-svn
pkgver=4926
pkgrel=1
pkgdesc="the Java VoIP and Instant Messaging client"
arch=('i686' 'x86_64')
url="http://sip-communicator.org"
license=('GPL')
makedepends=('subversion' 'apache-ant' 'openjdk6')
depends=()
conflicts=()
provides=()
source=()                                                                                                   
md5sums=()

_svnmod=sip-communicator
_svntrunk=https://sip-communicator.dev.java.net/svn/sip-communicator/trunk/

build() {

 cd $startdir/src
 rm -rf $startdir/src/$_svnmod-build

 msg "Getting sources from SVN ..."

 svn co $_svntrunk $_svnmod --username guest --password "" || return 1

 cp -rf $startdir/src/$_svnmod $startdir/src/$_svnmod-build
 cd $startdir/src/$_svnmod-build

 msg "SVN checkout done or server timeout"
 msg "Starting make..."

 ant rebuild 

 install -D \
  $startdir/src/$_svnmod-build/resources/install/debian/sip-communicator.sh.tmpl \
  $pkgdir/usr/bin/$_svnmod || return 1

 install -Dd \
  $startdir/src/$_svnmod-build/lib/bundle \
  $pkgdir/usr/lib/$_svnmod/lib/bundle || return 1

 install -D \
  $startdir/src/$_svnmod-build/lib/bundle/*.* \
  $pkgdir/usr/lib/$_svnmod/lib/bundle/ || return 1

 install -D \
  $startdir/src/$_svnmod-build/lib/*.* \
  $pkgdir/usr/lib/$_svnmod/lib/ || return 1

 install -Dd \
  $startdir/src/$_svnmod-build/lib/native \
  $pkgdir/usr/lib/$_svnmod/lib/native || return 1

 if [[ `uname -m` = "x86_64" ]]; then
  install -D \
   $startdir/src/$_svnmod-build/lib/native/linux-64/*.* \
   $pkgdir/usr/lib/$_svnmod/lib/native/
 else
  install -D \
   $startdir/src/$_svnmod-build/lib/native/linux/*.* \
   $pkgdir/usr/lib/$_svnmod/lib/native/
 fi

 install -Dd \
  $startdir/src/$_svnmod-build/sc-bundles \
  $pkgdir/usr/lib/$_svnmod/sc-bundles || return 1

 install -D \
  $startdir/src/$_svnmod-build/sc-bundles/*.* \
  $pkgdir/usr/lib/$_svnmod/sc-bundles/ || return 1

 install -D \
  $startdir/src/$_svnmod-build/lib/os-specific/linux/jdic_stub.jar \
  $pkgdir/usr/lib/$_svnmod/lib/ || return 1

 install -D \
  $startdir/src/$_svnmod-build/sc-bundles/os-specific/linux/media.jar \
  $pkgdir/usr/lib/$_svnmod/sc-bundles/ || return 1

 mkdir -p $pkgdir/usr/share/pixmaps
 cp $startdir/src/$_svnmod-build/resources/install/debian/$_svnmod.svg \
    $pkgdir/usr/share/pixmaps/$_svnmod.svg

 cp $startdir/src/$_svnmod-build/resources/install/debian/$_svnmod-16.xpm \
    $pkgdir/usr/share/pixmaps/$_svnmod-16.xpm

 cp $startdir/src/$_svnmod-build/resources/install/debian/$_svnmod-32.xpm \
    $pkgdir/usr/share/pixmaps/$_svnmod-32.svg

 mkdir -p $pkgdir/usr/share/applications
 cp $startdir/src/$_svnmod-build/resources/install/debian/$_svnmod.desktop \
    $pkgdir/usr/share/applications/

 rm -rf $startdir/src/$_svnmod-build

}

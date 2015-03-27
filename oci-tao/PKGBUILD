# Maintainer: Benjamin Oldenburg <benjamin.oldenburg@gmail.com>

pkgname=oci-tao
pkgver=2.2a
pkgrel=1
pkgdesc="CORBA 3.0 compliant C++ ORB"
arch=('i686' 'x86_64')
url="http://www.theaceorb.com"
license=('Other')
groups=('base-devel')
conflicts=('aceorb')
depends=('glibc')
source=(http://download.ociweb.com/TAO-2.2a/ACE+TAO-2.2a_with_latest_patches.tar.gz)
md5sums=('37d4a5e79e65a6fdbdcb23e013cd1cac')

build() {
  cd "$srcdir"/ACE_wrappers
  
  export ACE_ROOT="$srcdir"/ACE_wrappers
  export TAO_ROOT=$ACE_ROOT/TAO
  export LD_LIBRARY_PATH=$ACE_ROOT/lib:$LD_LIBRARY_PATH

  echo "#include \"$ACE_ROOT/ace/config-linux.h\"" > $ACE_ROOT/ace/config.h
  echo "include \$(ACE_ROOT)/include/makeinclude/platform_linux.GNU" > $ACE_ROOT/include/makeinclude/platform_macros.GNU
  echo "INSTALL_PREFIX=/usr" >> $ACE_ROOT/include/makeinclude/platform_macros.GNU
 
  cd $ACE_ROOT/ace && make
  cd $ACE_ROOT/apps/gperf/src && make
  cd $TAO_ROOT/TAO_IDL && make
  cd $TAO_ROOT/tao && make
  cd $TAO_ROOT/orbsvcs && make
}

package() {
  cd "$srcdir"/ACE_wrappers
  
  export ACE_ROOT="$srcdir"/ACE_wrappers
  export TAO_ROOT=$ACE_ROOT/TAO
  export LD_LIBRARY_PATH=$ACE_ROOT/lib:$LD_LIBRARY_PATH
  
  cd $ACE_ROOT/ace && make DESTDIR="$pkgdir" install
  cd $ACE_ROOT/apps/gperf/src && make DESTDIR="$pkgdir" install
  cd $TAO_ROOT/TAO_IDL && make DESTDIR="$pkgdir" install
  cd $TAO_ROOT/tao && make DESTDIR="$pkgdir" install
  cd $TAO_ROOT/orbsvcs && make DESTDIR="$pkgdir" install
  
  echo "#include \"/usr/include/ace/config-linux.h\"" > $pkgdir/usr/include/ace/config.h
}


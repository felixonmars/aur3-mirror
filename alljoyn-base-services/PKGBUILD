# Maintainer: Your Name <youremail@domain.com>
pkgname=alljoyn-base-services
_sourcename=alljoyn-services
pkgver=14.12.00
pkgrel=1
pkgdesc="Allseen Alliance's Alljoyn framework for IoT"
arch=('i686' 'x86_64')
url="http://alljoyn.org"
license=('ISC')
groups=('allseen')
depends=('alljoyn')
makedepends=('scons')
options=(!ccache !distcc)
source=(https://allseenalliance.org/releases/alljoyn/14.12/$_sourcename-14.12.00-src.tar.gz)
md5sums=('389c2623619281e6849da25cee7e1bb7')
_variant=release # release or debug
_services=('config' 'controlpanel' 'notification' 'onboarding' 'sample_apps' 'services_common' 'time')

build() {
  cd "$_sourcename-$pkgver-src"
  unset GTEST_DIR # Removing possible troubling variable
  # You may want to add -j X
  # VARIANT=release,debug
  # NDEBUG=undefined,defined
  cd services/base
  echo $_services
  for d in ${_services[@]} ; do
	  cd $d
	  scons \
	    VARIANT=$_variant \
	    WS=off \
	    NDEBUG=defined \
	    BINDINGS=cpp,$has_java \
	    BR=off \
	    V=1 -j`nproc`
	  cd ..
  done
}

package() {
  cd "$_sourcename-$pkgver-src"

  # Installing binaries, libs and headers
  _arch=$(if [ $CARCH = 'x86_64' ]; then echo x86_64; elif [ $CARCH = 'i686' ]; then echo x86; fi)
  # No binaries installed yet
 # mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/
  for service in ${_services[@]}; do
#	  cp $srcdir/$_sourcename-$pkgver-src/services/base/$service/build/linux/$_arch/$_variant/dist/$service/bin/* $pkgdir/usr/bin/ || echo -n ''
	  cp -r $srcdir/$_sourcename-$pkgver-src/services/base/$service/build/linux/$_arch/$_variant/dist/$service/lib/* $pkgdir/usr/lib/ || echo -n ''
	  cp -r $srcdir/$_sourcename-$pkgver-src/services/base/$service/build/linux/$_arch/$_variant/dist/$service/inc/* $pkgdir/usr/include/ || echo -n ''
  done
  
}

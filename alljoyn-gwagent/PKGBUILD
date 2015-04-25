# Maintainer: Your Name <youremail@domain.com>
pkgname=alljoyn-gwagent
pkgver=14.12.00
pkgrel=1
pkgdesc="Allseen Alliance's Alljoyn Gateway Agent for IoT"
arch=('i686' 'x86_64')
url="http://alljoyn.org"
license=('ISC')
groups=('allseen')
depends=('alljoyn' 'alljoyn-base-services')
makedepends=('scons')
options=(!ccache !distcc)
source=(https://allseenalliance.org/releases/alljoyn/14.12/$pkgname-14.12.00-src.tar.gz)
md5sums=('f195c9de78365537e588cb578517e6a9')
_variant=release # release or debug
_services=('config' 'controlpanel' 'notification' 'onboarding' 'sample_apps' 'services_common' 'time')

build() {
  cd "$pkgname-$pkgver-src"
  unset GTEST_DIR # Removing possible troubling variable
  # You may want to add -j X
  # VARIANT=release,debug
  # NDEBUG=undefined,defined
  cd gateway/gwagent
  scons \
    VARIANT=$_variant \
    WS=off \
    NDEBUG=defined \
    BINDINGS=cpp,$has_java \
    BR=off \
    V=1 -j`nproc`
}

package() {
  cd "$pkgname-$pkgver-src"

  # Installing binaries, libs and headers
  _arch=$(if [ $CARCH = 'x86_64' ]; then echo x86_64; elif [ $CARCH = 'i686' ]; then echo x86; fi)
  # No binaries installed yet
  # mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/
  # cp $srcdir/$pkgname-$pkgver-src/gateway/gwagent/build/linux/$_arch/$_variant/dist/gatewayConnector/bin/* $pkgdir/usr/bin/ || echo -n ''
  cp -r $srcdir/$pkgname-$pkgver-src/gateway/gwagent/build/linux/$_arch/$_variant/dist/gatewayConnector/lib/* $pkgdir/usr/lib/ || echo -n ''
  cp -r $srcdir/$pkgname-$pkgver-src/gateway/gwagent/build/linux/$_arch/$_variant/dist/gatewayConnector/inc/* $pkgdir/usr/include/ || echo -n ''
  
}

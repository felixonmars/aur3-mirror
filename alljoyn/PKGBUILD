# Maintainer: Your Name <youremail@domain.com>
pkgname=alljoyn
pkgver=14.12.00b
pkgrel=1
pkgdesc="Allseen Alliance's Alljoyn framework for IoT"
arch=('i686' 'x86_64')
url="http://alljoyn.org"
license=('ISC')
groups=('allseen')
makedepends=('scons')
options=(!ccache !distcc)
install='alljoyn.install'
source=(https://allseenalliance.org/releases/alljoyn/14.12/$pkgname-$pkgver-src.tar.gz
	0001-disable-warnings-as-errors.patch
	alljoyn-daemon.service
	alljoyn.install)
md5sums=('74ed192672f4330022f71c6f72095690'
         'f5fd2d07888b88c22d8c6348493ec7c5'
         '0a85487f8efdf60aa1e7772878a8cfb3'
         'effea7974cf7850f4854810a7a5086b3')
_variant=release # release or debug

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  patch -Np1 -i ../0001-disable-warnings-as-errors.patch
}

build() {
  cd "$pkgname-$pkgver-src"
  unset GTEST_DIR # Removing possible troubling variable
  # You may want to add -j X
  # VARIANT=release,debug
  # NDEBUG=undefined,defined
  scons \
    VARIANT=$_variant \
    WS=off \
    NDEBUG=defined \
    BINDINGS=c,cpp,$has_java,$has_js,$has_unity \
    BR=off \
    V=1 -j5
}

package() {
  cd "$pkgname-$pkgver-src"

  # Installing binaries, libs and headers
  _arch=$(if [ $CARCH = 'x86_64' ]; then echo x86_64; elif [ $CARCH = 'i686' ]; then echo x86; fi)
  mkdir -p $pkgdir/usr/bin/
  cp build/linux/$_arch/$_variant/dist/cpp/bin/* $pkgdir/usr/bin/ || echo "Skipping samples/"
  cp build/linux/$_arch/$_variant/dist/c/bin/* $pkgdir/usr/bin/ || echo "Skipping samples/"
  mkdir -p $pkgdir/usr/lib/
  cp build/linux/$_arch/$_variant/dist/cpp/lib/*.{so,a} $pkgdir/usr/lib/
  cp build/linux/$_arch/$_variant/dist/c/lib/*.{so,a} $pkgdir/usr/lib/
  mkdir -p $pkgdir/usr/include/
  cp -r build/linux/$_arch/$_variant/dist/cpp/inc/* $pkgdir/usr/include/
  cp -r build/linux/$_arch/$_variant/dist/c/inc/* $pkgdir/usr/include/

  # Installing service files
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp ${srcdir}/alljoyn-daemon.service $pkgdir/usr/lib/systemd/system/
}

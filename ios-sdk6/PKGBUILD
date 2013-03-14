# Maintainer: yetist <yetist@gmail.com>
pkgname=ios-sdk6
pkgver=6.0
pkgrel=2
pkgdesc="iPhone 6.0 sdk with ARC support"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ios-toolchain-based-on-clang-for-linux"
license=('GPL')
optdepends=('iphonesdk-utils')
provides=('ios-sdk')
source=("http://ios-toolchain-based-on-clang-for-linux.googlecode.com/files/iPhoneOS${pkgver}.sdk.tar.xz"
'float.h'
'stdarg.h')
md5sums=('bd5a662fec7a580284db94a6d38e123f'
'92e0a5394cc49447b0bd17f1626bafa8'
'51b2ef2e7471df33433bce8fbe85e771')

build() {
  echo "Building..."
}

package() {
  [ -d $pkgdir/usr/share ] || mkdir -p $pkgdir/usr/share
  mv $srcdir/iPhoneOS${pkgver}.sdk $pkgdir/usr/share
  install -Dm644 $srcdir/float.h $pkgdir/usr/share/iPhoneOS6.0.sdk/usr/include/float.h
  install -Dm644 $srcdir/stdarg.h $pkgdir/usr/share/iPhoneOS6.0.sdk/usr/include/stdarg.h
  #ln -sf crt1.o $pkgdir/usr/share/iPhoneOS6.0.sdk/usr/lib/crt1.3.1.o
}

# vim:set ts=2 sw=2 et:

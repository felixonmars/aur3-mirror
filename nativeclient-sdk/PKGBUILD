# Maintainer: Yejun Yang <yejunx AT gmail DOT com>
pkgname=nativeclient-sdk
pkgver=0.1.507
pkgrel=2
pkgdesc="Write native code for the web"
arch=(any)
url="http://code.google.com/p/${pkgname}/"
license=(custom)
depends=(python2 lib32-glibc)
optdepends=(lib32-sdl lib32-openssl098)
[ $CARCH == "i686" ] && depends=(${depends[@]/lib32-/}) 
[ $CARCH == "i686" ] && optdepends=(${optdepends[@]/lib32-/})
source=(http://commondatastorage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk_${pkgver//./_}/naclsdk_linux.tgz
        nacl.sh)
md5sums=('84832007c2f7b7649680ce9a90bda11f'
         '18c4e48741406eea997d6fea040da119')
build() {
  :
}

package() {
  mkdir -p $pkgdir/opt/google
  mv $srcdir/native_client_sdk_${pkgver//./_}_0 $pkgdir/opt/google/nacl-sdk
  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cd $pkgdir/opt
  find . -readable -exec chmod a+r {} \;
  find . -executable -exec chmod a+x {} \;
  cd $pkgdir/usr/share/licenses/$pkgname
  ln -s ../../../../opt/google/nacl-sdk/LICENSE .
  install -D -m755 $srcdir/nacl.sh $pkgdir/etc/profile.d/nacl.sh
  mkdir -p $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  find ../../opt/google/nacl-sdk/toolchain/linux_x86/bin -type f -executable -exec ln -s {} . \;
}
# vim:set ts=2 sw=2 et:

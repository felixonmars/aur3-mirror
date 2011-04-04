# contributor: Côme "MCMic" BERNIGAUD <mcmic@free.fr>
# contributor: Marcin "eXine" M. <exine@jun.pl>

pkgname=android-ndk-crystax
pkgver=r5b
pkgrel=1
pkgdesc="android C/C++ developer kit with enabled support of C++ exceptions, RTTI and Standard C++ Library"
arch=(i686 x86_64)
url="http://www.crystax.net/android/ndk-r5.php"
license=('GPL')
depends=(android-sdk)
makedepends=()
source=(http://www.crystax.net/data/android-ndk-r5-linux-x86-crystax-1.beta1.tar.bz2)
md5sums=('68fc34ed61377480382918d0be6138d7')
options=(!strip)

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/opt/
  cd android-ndk-r5-crystax
  #~ patch -p1 < ../android-ndk-r4-crystax-4.diff
  export ANDROID_NDK_ROOT=`pwd`
  #~ ./build/tools/download-toolchain-sources.sh --release=myrelease --package --over-http --verbose --for-date=2010-07-15
  #~ ./build/tools/rebuild-all-prebuilt.sh --verbose --package --toolchain-src-pkg=/tmp/android-ndk-toolchain-myrelease.tar.bz2
  #~ rm -Rf ./build/prebuilt
  #~ tar xjvf /tmp/android-ndk-prebuilt-????????-linux-x86.tar.bz2

  cp -a $srcdir/android-ndk-r5-crystax $pkgdir/opt/$pkgname
  export ANDROID_NDK_ROOT="opt/$pkgname"
}

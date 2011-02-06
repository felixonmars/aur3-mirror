# contributor: Côme "MCMic" BERNIGAUD <mcmic@free.fr>
# contributor: Marcin "eXine" M. <exine@jun.pl>

pkgname=android-ndk-crystax
pkgver=r4b
pkgrel=1
pkgdesc="android C/C++ developer kit with enabled support of C++ exceptions, RTTI and Standard C++ Library"
arch=(i686 x86_64)
url="http://developer.android.com/sdk/ndk/index.html"
license=('GPL')
depends=(android-sdk)
makedepends=(unzip)
source=(http://dl.google.com/android/ndk/android-ndk-$pkgver-linux-x86.zip http://www.crystax.net/data/android-ndk-r4-crystax-4.diff)
md5sums=('2deabcb125c219b34140975b710f00ec' 'eca87c08dfd03467cd627d341c9a9e4d')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/opt/
  cd android-ndk-$pkgver
  patch -p1 < ../android-ndk-r4-crystax-4.diff
  export ANDROID_NDK_ROOT=`pwd`
  ./build/tools/download-toolchain-sources.sh --release=myrelease --package --over-http --verbose --for-date=2010-07-15
  ./build/tools/rebuild-all-prebuilt.sh --verbose --package --toolchain-src-pkg=/tmp/android-ndk-toolchain-myrelease.tar.bz2
  rm -Rf ./build/prebuilt
  tar xjvf /tmp/android-ndk-prebuilt-????????-linux-x86.tar.bz2

  cp -a $srcdir/android-ndk-$pkgver $pkgdir/opt/$pkgname
  export ANDROID_NDK_ROOT="opt/$pkgname"
}

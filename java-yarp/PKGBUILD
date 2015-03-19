# Contributor: Victor Noël

_realpkgname=yarp
pkgname=java-$_realpkgname
pkgver=2.3.63
pkgrel=1
pkgdesc="Yet Another Robot Platform"
url="http://eris.liralab.it/yarp/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('cmake' 'swig' 'jdk')
depends=('yarp' 'java-environment')
options=(!libtool)
source=(http://downloads.sourceforge.net/yarp0/$_realpkgname-$pkgver.tar.gz)
md5sums=('3e0243e09276d716ac317413c753037f')


build() {
  mkdir build-$pkgname-$pkgver
  cd build-$pkgname-$pkgver

  # CXX_FLAGS is to prevent jni crash... (see the README file in swig dir)
  cmake ../$_realpkgname-$pkgver/example/swig/ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="-fno-strict-aliasing" -DCREATE_JAVA=TRUE
  make

  mkdir classes
  javac -d classes generated_src/*.java
  cd classes
  jar cf ../$pkgname-$pkgver.jar yarp
}

package() {
  cd $srcdir/build-$pkgname-$pkgver

  # no install script...
  mkdir -p $pkgdir/usr/share/doc/yarp/
  mkdir -p $pkgdir/usr/lib/
  cp libjyarp.so $pkgdir/usr/lib/
  cp $pkgname-$pkgver.jar $pkgdir/usr/share/doc/yarp/
}

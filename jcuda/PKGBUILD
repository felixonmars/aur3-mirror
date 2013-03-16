# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=jcuda
pkgver=0.5.0
pkgrel=1
pkgdesc="jCUDA provides CUDA bindings in Java."
url="http://www.jcuda.de"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('java-environment>=6')
optdepends=()
makedepends=('cmake')
conflicts=()
replaces=()
backup=()
install=
source=("http://www.jcuda.de/downloads/JCuda-All-${pkgver}-src.zip")
md5sums=('e3abfbef3ff3fa30804dd9ecea04b4b1')

build() {
  cd "${srcdir}/JCuda-All-${pkgver}-src"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCUDA_TOOLKIT_INCLUDE=/opt/cuda/include
  make

  # compile and jar jcuda
  cd JCudaJava/src/
  javac jcuda/driver/*.java
  javac jcuda/runtime/*.java
  javac jcuda/*.java
  jar cvf jcuda-${pkgver}-${_pkgver}.jar jcuda/*.class jcuda/driver/*.class jcuda/runtime/*.class
  cd ../../

  # compile and jar jcublas
  cd JCublasJava/src
  javac -classpath ../../JCudaJava/src/jcuda-${pkgver}-${_pkgver}.jar jcuda/jcublas/*.java
  jar cvf jcublas-${pkgver}-${_pkgver}.jar jcuda/jcublas/*.class
  cd ../../

  # compile and jar cufft
  cd JCufftJava/src
  javac -classpath ../../JCudaJava/src/jcuda-${pkgver}-${_pkgver}.jar jcuda/jcufft/*.java
  jar cvf jcufft-${pkgver}-${_pkgver}.jar jcuda/jcufft/*.class
  cd ../../

  # compile and jar curand
  cd JCurandJava/src
  javac -classpath ../../JCudaJava/src/jcuda-${pkgver}-${_pkgver}.jar jcuda/jcurand/*.java
  jar cvf jcurand-${pkgver}-${_pkgver}.jar jcuda/jcurand/*.class
  cd ../../

  # compile and jar cusparse
  cd JCusparseJava/src
  javac -classpath ../../JCudaJava/src/jcuda-${pkgver}-${_pkgver}.jar jcuda/jcusparse/*.java
  jar cvf jcusparse-${pkgver}-${_pkgver}.jar jcuda/jcusparse/*.class
  cd ../../

}

package() {
  cd "${srcdir}/JCuda-All-${pkgver}-src"
  install -Dm644 lib/libCommonJNI.a "$pkgdir/usr/lib/${pkgname}/libCommonJNI.a"
  install -Dm755 lib/libJCublas-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCublas-linux-x86_64.so"
  install -Dm755 lib/libJCudaDriver-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCudaDriver-linux-x86_64.so"
  install -Dm755 lib/libJCudaRuntime-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCudaRuntime-linux-x86_64.so"
  install -Dm755 lib/libJCufft-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCufft-linux-x86_64.so"
  install -Dm755 lib/libJCurand-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCurand-linux-x86_64.so"
  install -Dm755 lib/libJCusparse-linux-x86_64.so "$pkgdir/usr/lib/${pkgname}/libJCusparse-linux-x86_64.so"
  install -Dm644 JCudaJava/src/jcuda-${pkgver}-${_pkgver}.jar "$pkgdir/usr/lib/${pkgname}/jcuda-${pkgver}-${_pkgver}.jar"
  install -Dm644 JCublasJava/src/jcublas-${pkgver}-${_pkgver}.jar "$pkgdir/usr/lib/${pkgname}/jcublas-${pkgver}-${_pkgver}.jar"
  install -Dm644 JCufftJava/src/jcufft-${pkgver}-${_pkgver}.jar "$pkgdir/usr/lib/${pkgname}/jcufft-${pkgver}-${_pkgver}.jar"
  install -Dm644 JCurandJava/src/jcurand-${pkgver}-${_pkgver}.jar "$pkgdir/usr/lib/${pkgname}/jcurand-${pkgver}-${_pkgver}.jar"
  install -Dm644 JCusparseJava/src/jcusparse-${pkgver}-${_pkgver}.jar "$pkgdir/usr/lib/${pkgname}/jcusparse-${pkgver}-${_pkgver}.jar"
}

# vim:set ts=2 sw=2 et:

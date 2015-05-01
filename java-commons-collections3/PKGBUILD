# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=java-commons-collections3
pkgver=3.2.1
pkgrel=1
pkgdesc='Implementations of common collections (version 3)'
arch=(i686 x86_64)
url='http://commons.apache.org/collections/'
license=(apache)
depends=(java-runtime)
makedepends=(apache-ant junit)
source=("http://archive.apache.org/dist/commons/collections/source/commons-collections-${pkgver}-src.tar.gz")
md5sums=('031ce05872ddb0462f0dcce1e5babbe9')

build() {
  cd "commons-collections-${pkgver}-src"

  ant jar
}

package() {
  cd "commons-collections-${pkgver}-src/build/"

  install -dm755 "${pkgdir}/usr/share/java/commons-collections3/"
  install -m644 commons-collections-${pkgver}.jar \
    "${pkgdir}/usr/share/java/commons-collections3/commons-collections.jar"
}


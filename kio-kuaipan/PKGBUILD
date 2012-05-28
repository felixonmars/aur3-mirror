# Maintainer: HUANG Jiaqi <wanderhuang#gmail.com>

pkgname=kio-kuaipan
pkgver=0.2
pkgrel=1
pkgdesc="kio-kuaipan is a kio plugin for KingSoft KuaiPan storage."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=151020"
license=('GPL')
depends=('kdelibs' 'qca' 'qoauth' 'qjson')
makedepends=('cmake' 'automoc4' 'boost')
source=("http://kde-apps.org/CONTENT/content-files/151020-${pkgname}-${pkgver}.tar.bz2")


build() {
  cd "$srcdir"

  cd "${pkgname}-${pkgver}"
  sed -i -e "s/QJson/QJSON/" CMakeLists.txt
  sed -i -e "s/QJSON_LIBRARY/QJSON_LIBRARIES/" CMakeLists.txt
  cd ..

  msg "Starting make..."

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

md5sums=('ce20f88fc77366c19772d54988ec2f32')

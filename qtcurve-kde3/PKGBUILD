# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=qtcurve-kde3
pkgver=1.8.5
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk'
arch=('i686' 'x86_64')
url='https://github.com/QtCurve/qtcurve-qt3'
license=('GPL')
depends=('kdelibs3')
makedepends=('cmake')
source=("qtcurve-qt3-$pkgver.tar.gz::https://github.com/QtCurve/qtcurve-qt3/archive/$pkgver.tar.gz"
        "qtcurve-$pkgver.tar.gz::https://github.com/QtCurve/qtcurve/archive/$pkgver.tar.gz")

prepare() {
  cp -r qtcurve-$pkgver/common qtcurve-qt3-$pkgver/
}

build() {
  cd qtcurve-qt3-$pkgver

  source /etc/profile.d/kde3.sh

  mkdir -p build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DQT_PLUGINS_DIR=/usr/lib/qt3/plugins
  make
}

package() {
  cd qtcurve-qt3-$pkgver/build
  make DESTDIR="$pkgdir" install
}

sha512sums=('2f74dc06d3daa97812ee88678e587e31f70acd8dbb5c31c5b7011c5b2c96707d6aa3481e081a5d493c3d2762ef853ed7c864a31517841001a3f03012b709c8ec'
            '6db4b877a01542c8c46f688db011ab473fa201fa9ce41479495972fe51ba486320d01d08d5c345caafd04f9a95e87a16bc963f5e821a7dc9fdc2fe0e17364d69')

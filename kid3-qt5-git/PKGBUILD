# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kid3-qt5-git
pkgver=3.1.2.3.gdde838e
pkgrel=1
pkgdesc='An MP3, Ogg/Vorbis and FLAC tag editor. Qt5 (GIT Version)'
arch=('i686' 'x86_64')
url='http://kid3.sourceforge.net/'
license=('GPL')
depends=('qt5-multimedia' 'id3lib' 'taglib' 'chromaprint' 'desktop-file-utils')
makedepends=('git' 'cmake')
conflicts=('kid3')
provides=('kid3')
source=("kid3::git://git.code.sf.net/p/kid3/code")
sha1sums=('SKIP')
install=kid3-qt5-git.install

pkgver() {
  cd kid3
  echo "$(git describe --long --tags | tr _ . |tr - . | sed 's|Rel.||g')"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build
  pwd
  cmake ../kid3 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_MOC_EXECUTABLE=moc-qt5 \
        -DWITH_QT5=ON \
        -DWITH_APPS="Qt;cli"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

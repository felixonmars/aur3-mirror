# Contributor: Diestelhenne <diestelhenne@googlemail.com>

pkgname=openoffice-thumbnail-plugin
pkgver=1.0.0
pkgrel=2
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview OpenOffice.org files (Open Document Format) as Thumbnails."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/OpenOffice.org+Thumbnail+plugin?content=110864"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://kenai.com/downloads/kde-odf-thumbnail/1.0.0/kde-odf-thumbnail-$pkgver.tar.gz)
license=('GPL')
md5sums=('edf694939f4b5d5e97c3fe2f91e7cec3')

build() {
  cd $srcdir/kde-odf-thumbnail-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
  make
}

package() {
  cd $srcdir/kde-odf-thumbnail-$pkgver/build
  make DESTDIR=$pkgdir install
}

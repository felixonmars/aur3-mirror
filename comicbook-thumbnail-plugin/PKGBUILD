pkgname=comicbook-thumbnail-plugin
pkgver=0.1
pkgrel=4
pkgdesc="A Thumbnail creator for KDE 4 that enables previewing ComicBook Reader files"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/ComicBook+Thumbnail+Plugin?content=114266"
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://bitbucket.org/qwertymaniac/comicbook-thumbnails/get/comicbook-thumbnails-$pkgver.tar.gz)
md5sums=('8d02267dd7ebe91e9b69eda281171b5b')

build() {
  cd "$srcdir/comicbook-thumbnails"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
  make || return 1
  make DESTDIR=$pkgdir install
  kbuildsycoca4
}


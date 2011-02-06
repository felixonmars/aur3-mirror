# Contributor: Harsh J <harsh at harshj dot com>

pkgname=comicbook-thumbnails-kde4
pkgver=0.1
pkgrel=1
pkgdesc="Plugin for KDE file managers (Dolphin and Konqueror) to preview Comic Book file covers (.cbr, .cbz, .cbt) as Thumbnails."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/ComicBook+Thumbnail+Plugin?content=114266"
depends=('kdebase-workspace' 'unrar')
makedepends=('cmake' 'automoc4')
source=(http://bitbucket.org/qwertymaniac/comicbook-thumbnails/get/comicbook-thumbnails-$pkgver.tar.gz)
license=('GPL')
md5sums=('8d02267dd7ebe91e9b69eda281171b5b')

build() {
  cd $srcdir/comicbook-thumbnails
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ../
  make || return 1
  make DESTDIR=$pkgdir install
}
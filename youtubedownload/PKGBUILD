# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=youtubedownload
pkgver=0.3
pkgrel=1
pkgdesc="A Konqueror extension for downloading youtube videos right from YouTube video page"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=121350"
license=('GPL')
depends=('kdebase-konqueror')
source=("http://www.kde-apps.org/CONTENT/content-files/121350-konqueror-plugin-${pkgname}.tar.gz")
md5sums=('8a8d5131fcc60b0c3fdb21ed75ee55e6')

build() {
  cd ${srcdir}
  mkdir build
  cd build
  cmake ../konqueror-plugin-${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install || return 1
}

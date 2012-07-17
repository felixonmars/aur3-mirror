# Maintainer: Zom Aur <zom[at]eevul[dot]org>

pkgname=krunner-chromiumbookmarks
pkgver=0.2
pkgrel=1
pkgdesc='A runner that integrates chromium bookmarks into krunner'
arch=('i686' 'x86_64')
url=(http://kde-look.org/content/show.php/Browse+Chromium+Bookmarks?content=137685)
license=('GPL')
depends=('qjson' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=(http://kde-look.org/CONTENT/content-files/137685-browsechromiumbookmarks.tar.bz2)
md5sums=('61de92ce6f62affa478e74db77f93aa7')

build() {
  cd ${srcdir}/plasma-runner-browsechromiumbookmarks/
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR=${pkgdir} install
}

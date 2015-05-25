# Contributor: Damian Barberon <damian01w at gmail dot com>

pkgname=k4guitune
pkgver=1.1.1
pkgrel=1
pkgdesc="A chromatic tuner for KDE4"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?action=content&content=117669"
depends=('kdebase-workspace' 'fftw>=3.1.0')
makedepends=('cmake' 'automoc4' 'docbook-xml')
source=('http://kde-apps.org/CONTENT/content-files/117669-k4guitune-1.1.1.tar.gz')
license=('GPL')
md5sums=('9ae1f1ac2517be2c99e042eeb25b404f')

package() {
  cd $srcdir/$pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' ../
  make
  make DESTDIR="${pkgdir}" install
}

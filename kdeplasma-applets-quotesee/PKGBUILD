# Maintainer: Pete Daniels <teeahr1 AT gee-mail DOT communism> (You can figure it out, right?)

pkgname=kdeplasma-applets-quotesee
pkgver=0.2.2
pkgrel=1
pkgdesc="Stock and currency quote plasmoid for KDE"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/QuoteSee+Stock%2BCurrency+plasmoid?content=101760"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('quotesee-plasmoid')
replaces=('quotesee-plasmoid')
source=("http://kde-look.org/CONTENT/content-files/101760-plasma_quotesee-$pkgver.tar.gz")
md5sums=('d3b5c3d3026bc6c6159399c87cd0ddeb')

build() {
  mkdir build
  cd build
  cmake ../plasma_quotesee-$pkgver \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
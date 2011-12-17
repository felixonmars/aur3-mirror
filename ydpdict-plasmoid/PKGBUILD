# Maintainer: Marcin Witowski <mars3n@gmail.com>

pkgname=ydpdict-plasmoid
pkgver=0.7.9
pkgrel=1
pkgdesc="KDE 4.X plasma interface for YDP Collins and Langenscheidt dictionaries on Linux platform."
url=('http://www.kde-look.org/content/show.php/YDPDict?content=107700')
license=('GPL')
arch=('i686' 'x86_64')
depends=('kdebase-workspace' 'libydpdict>=1.0.0')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/107700-YDPDict_${pkgver}.tar.gz)

build() {
  cd $srcdir/YDPDict_${pkgver}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ../
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

md5sums=('5d11f4db0939aeaf5d1c5c69777d5260')

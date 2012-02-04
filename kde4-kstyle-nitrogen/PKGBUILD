# Contributor: sxe <sxxe @ gmx.de>
pkgname=kde4-kstyle-nitrogen
pkgver=1.0.5
pkgrel=1
pkgdesc="Nitrogen-style is a temporary fork of the Oxygen widget style for KDE4."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Nitrogen-style?content=112652"
license=("GPL")
depends=('kdelibs>=4.3')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/112652-kde4-kstyle-nitrogen-$pkgver-Source.tar.gz)


build() {
  cd kde4-kstyle-nitrogen-$pkgver-Source
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}


md5sums=('0e4b7d33cca5ec200774fdd8be3c4e13')

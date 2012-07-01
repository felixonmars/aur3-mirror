#Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>

pkgname=kdeplasma-addons-applets-miniplayer
pkgver=2.5
pkgrel=1
pkgdesc="A plasmoid for playing multimedia."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Mini+Player?content=95501"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/95501-miniplayer-"${pkgver}".tar.bz2)
md5sums=('71f353a4bcafde8349da62131bf9a595')

build() {
cd "${srcdir}"/miniplayer-"${pkgver}"
cmake . -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
make
}

package() {
cd "${srcdir}"/miniplayer-"${pkgver}"
make DESTDIR="${pkgdir}" install
}

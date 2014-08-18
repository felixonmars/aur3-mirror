# Maintainer: Pafrape <pafrape@free.fr>

pkgname=kfoldersync
pkgver=2.7.1
pkgrel=1
pkgdesc="Folder synchronization tool"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KFolderSync?content=164092"
depends=('kdelibs')
license=('GPL')
groups=('KDE')
source=(http://opendesktop.org/CONTENT/content-files/164092-${pkgname}_${pkgver}.orig.tar.xz)
sha1sums=('4d18b8347812b974cfb613cdfb151153a83ab324')
makedepends=('cmake' 'automoc4')

#http://opendesktop.org/CONTENT/content-files/164092-kfoldersync_2.7.1.orig.tar.xz

prepare() {
mkdir -p build
}

build() {
cd build
CXXFLAGS="$CXXFLAGS -std=gnu++11"
cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release ../${pkgname}-${pkgver}
make || return 1
}

package() {
cd build
make DESTDIR="$pkgdir/" install
} 
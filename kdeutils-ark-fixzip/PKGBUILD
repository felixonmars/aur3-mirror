# $Id: PKGBUILD 195794 2013-10-01 15:37:03Z svenstaro $
# Maintainer: leaeasy <leaeasy@gmail.com>

pkgname=kdeutils-ark-fixzip
_pkgname=kdeutils-ark
pkgver=4.12.1
pkgrel=1
pkgdesc='KDE Archiving Tool with zip coding fix'
url='http://kde.org/applications/utilities/ark/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdeutils')
depends=('kdebase-runtime' 'kdebase-lib' 'libarchive' 'qjson' 'p7zip-fixzip')
#depends=('kdebase-runtime' 'kdebase-lib' 'libarchive' 'qjson')
conflicts=('kdeutils-ark')
provides=('kdeutils-ark')
makedepends=('cmake' 'automoc4')
optdepends=('zip' 'unzip' 'unrar')
install=${_pkgname}.install
source=("http://download.kde.org/stable/${pkgver}/src/ark-${pkgver}.tar.xz"
	"fix-zip-wrong-coding-with-7z.patch")
sha1sums=('788e43ec97e9c3c60ce494c784ed41c298a7c8fd'
	'b02e66ff91d6120e84b3fca0deccc0385f84e5e3')
prepare() {
  cd "${srcdir}"/ark-${pkgver}
  patch -p1 -i "${srcdir}"/fix-zip-wrong-coding-with-7z.patch
}


build() {
  cd "${srcdir}"
  mkdir build
  cd build
  cmake ../ark-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}

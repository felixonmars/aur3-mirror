 # Contributor: sxe <sxxe at gmx dot de>

pkgname=plasmoid-pirc
pkgver=0.3
pkgrel=1
pkgdesc="PIRC - IRC Plasmoid"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php?content=108428"
license=('GPL')
depends=('kdebase-workspace>=4.2.91')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/108428-pirc_beta3.tar.bz2)


build() {
cd $srcdir
mkdir $pkgname-build
cd $pkgname-build

cmake ../pirc_beta3 \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr
make || return 1
make DESTDIR=$pkgdir install || return 1
}

md5sums=('2098a1e4deb894c7df800069d5572522')

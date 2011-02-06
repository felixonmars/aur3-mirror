#Contributor: Jan Zitnik <jan@zitnik.org>

pkgname=kget-runner
pkgver=0.1
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Start downloads in KRunner"
url="http://kde-look.org/content/show.php/KGet+Runner?content=112349"
license="GPL"
depends=('kdebase')
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/112349-kgetrunner-0.1.6.tar.gz)
md5sums=('fe996f954203227823e8797bf7d059aa')

build() {
cd $startdir/src/kgetrunner-0.1.6
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1
}
#Contributor: Jan Zitnik <jan@zitnik.org>

pkgname=vbox-runner
pkgver=0.3.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Run Virtualbox machines in KRunner"
url="http://www.kde-look.org/content/show.php/VBox+Runner?content=107926"
license="GPL"
depends=()
makedepends=('cmake' 'gcc' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/107926-vbox-runner-$pkgver.tar.gz)
md5sums=('8d00c807323882febd1b7cc0e237037b')

build() {
cd $startdir/src/vbox-runner-$pkgver
mkdir build
cd build

cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1
}

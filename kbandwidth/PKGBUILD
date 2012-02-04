# Maintainer: pauline123 <321eniluap at gmail dot com>
# Contributor: cmlr
# Contributor: Abbadon


pkgname=kbandwidth
pkgver=1.0.6
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="This tool can show speed of any network interfaces."
url="http://kde-apps.org/content/show.php?content=18939"
depends=('kdelibs') 
source=(http://kde-apps.org/CONTENT/content-files/18939-$pkgname.tar.gz)
md5sums=('aed320722a585ec4a90f941b13373423')


build() {
cd $srcdir/$pkgname
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` ..
make
make DESTDIR=$pkgdir install
}

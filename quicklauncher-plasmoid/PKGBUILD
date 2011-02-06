# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=quicklauncher-plasmoid
pkgver=0.5
pkgrel=1
pkgdesc="A plasmoid that reimplements the quicklaunch applet from kde3.5."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/QuickLauncher+Applet?content=78061"
license=('GPL2')
depends=('kdebase>=4.1.0')
makedepends=('cmake' 'gcc' 'automoc4')
conflicts=('quicklauncher-plasmoid-svn')
source=(http://www.svenstorp.com/plasma/applets/quicklauncher/$pkgver/plasma-applet-quicklauncher-$pkgver.tar.gz)
md5sums=('1c118743176d4bc0cff4d432eb138624')

build() {

cd $startdir/src/plasma-applet-quicklauncher-$pkgver/src
mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$startdir/pkg install || return 1

}

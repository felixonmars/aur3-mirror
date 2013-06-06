# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Contributor: Mark C < mark dot coolen at gmail dot com >
pkgname=kcometen4
pkgver=1.0.7
pkgrel=2
pkgdesc="A popular OpenGL KDE screensaver."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KCometen4?content=87586"
license=('GPL2')
depends=('kdebase-workspace' 'kdelibs>=4.1.0' 'libgl')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/87586-kcometen4-$pkgver.tar.gz
	archdiff-kcometen4.patch)

package() {

cd $srcdir/kcometen4-$pkgver
patch -p1 <../archdiff-kcometen4.patch

mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
md5sums=('61786ed2e408ce73bab941384187399a'
         'fcda933a697a57f915f2bd8f27979c0b')

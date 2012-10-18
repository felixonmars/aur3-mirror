# Maintainer: Joffrey TISSERON <tisseron.joffrey@aliceadsl.fr>

pkgname=kdeartwork-kscreensaver-koceansaver
_name2=koceansaver
_name=KOceanSaver
pkgver=0.71
pkgrel=1
pkgdesc='A nice OpenGL KDE screensaver.'
arch=('i686' 'x86_64')
url='http://www.kde-apps.org/content/show.php/KOceanSaver?content=95863'
license=('GPL2')
depends=('kdebase-workspace' 'kdelibs>=4.7' 'libgl')
makedepends=('cmake' 'automoc4')
conflicts=('koceansaver')
replaces=('koceansaver')
source=('http://sourceforge.net/projects/koceansaver/files/latest/download?
source=files')
md5sums=('ed1eea9d30cee738cd81eecdc2124d75')


build() {
  cd $srcdir/$_name
  cmake -DCMAKE_INSTALL_PREFIX=/usr CMakeLists.txt
  make
}

package() {
  cd $srcdir/$_name
  make DESTDIR="$pkgdir" install
}
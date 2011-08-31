pkgname=kdeplasma-addons-applets-cpufrequtility
_pkgname=kde-plasma-cpufrequtility
pkgver=1.4
pkgrel=1
pkgdesc="CPU Frequence Utility plasmoid."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/plasmaCpuFreqUtility?content=144809"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=("http://kde-apps.org/CONTENT/content-files/144809-kde-plasma-cpufrequtility-${pkgver}.tar.bz2"
	"CMakeLists.patch")
md5sums=('ede3379edb20528c094186c9fb71414d'
         'f707be28f56335844e2371d832ac9e65')
 
build() {
  cd "${srcdir}/kde-plasma-cpufrequtility-${pkgver}"
  patch -Np1 -i ../CMakeLists.patch
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
  sed -i -e 's|kde4/apps|apps|g' kde-plasma-cpufrequtility.desktop metadata.desktop
  sed -i -e 's|kde4/libexec|kde4|g' org.freedesktop.auth.cpufrequtility.service
}

package() {
  cd "${srcdir}/kde-plasma-cpufrequtility-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

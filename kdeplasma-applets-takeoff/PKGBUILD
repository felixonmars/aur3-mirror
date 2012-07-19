pkgname=kdeplasma-applets-takeoff
_pkgname=takeoff
pkgver=1.0
pkgrel=1
pkgdesc="Takeoff is a full screen menu inpired in the aspect of Slingshot and the OS X Launchpad menu but adapted to the KDE users in a plasmoid."
url="http://kde-apps.org/content/show.php/Takeoff?content=144078"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' )
conflicts=('kdeplasma-addons-applets-takeoff')
replaces=('kdeplasma-addons-applets-takeoff')
source=("http://takeoff-launcher.googlecode.com/files/${_pkgname}-${pkgver}.tar.gz")
md5sums=('ac03a1659d2d66448ae880b3dec06095')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
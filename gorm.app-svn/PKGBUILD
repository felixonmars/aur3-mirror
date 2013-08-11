# Contributor: spidermario <spidermario@free.fr>
# Contributor: libernux <dutchman55@gmx.com>
pkgname=gorm.app-svn
pkgver=36964
pkgrel=1
pkgdesc="Graphical User interface builder for GNUstep"
arch=(i686 x86_64)
url="http://gnustep.org/"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('subversion' 'gnustep-make')
provides=(gorm.app)
conflicts=(gorm.app)
source=('gorm::svn+http://svn.gna.org/svn/gnustep/apps/gorm/trunk/')
sha512sums=('SKIP')

pkgver() {
  cd gorm
  svnversion
}

build() {
  cd gorm

  . /etc/profile.d/GNUstep.sh
  make
}

package() {
  cd gorm

  . /etc/profile.d/GNUstep.sh
  make DESTDIR="$pkgdir" install
}

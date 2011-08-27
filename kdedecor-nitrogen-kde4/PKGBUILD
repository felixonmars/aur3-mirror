# Contributor: gtklocker <kostis@gtklocker.com>

pkgname=kdedecor-nitrogen-kde4
pkgver=3.3.3
pkgrel=2
pkgdesc="Nitrogen KDE window decoration"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=99551"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake')
source=(http://kde-look.org/CONTENT/content-files/99551-kde4-windeco-nitrogen-${pkgver}-Source.tar.gz)
md5sums=('52b751e25f782511e275e97a09481685')

build() {
  cd kde4-windeco-nitrogen-${pkgver}-Source

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make
}

package() {
  cd kde4-windeco-nitrogen-${pkgver}-Source
  make DESTDIR=${pkgdir} install
}
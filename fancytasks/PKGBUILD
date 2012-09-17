# Contributor sidious/SiD <miste78 web de>

pkgname=fancytasks
pkgver=1.1.2
pkgrel=1
pkgdesc="Plasmoid providing fancy visualization of tasks, launchers and jobs"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php?content=99737"
license=('GPL')
depends=('kdelibs' 'kdebase-workspace') 
makedepends=('automoc4')
source=(http://kde-apps.org/CONTENT/content-files/99737-${pkgname}-${pkgver}.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make DESTDIR=${pkgdir} install
  kbuildsycoca4
}

md5sums=('0ffe30331739972d88126dd828c0ea22')

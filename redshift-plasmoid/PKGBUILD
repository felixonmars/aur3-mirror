pkgname=redshift-plasmoid
pkgver=0.4.3
pkgrel=1
pkgdesc="Provides a configuration interface and a switch to start/stop Redshift daemon."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Redshift+plasmoid?content=148737"
license=('GPLv3')
depends=('kdebase-workspace' 'redshift')
makedepends=('cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/148737-${pkgname}-${pkgver}.tar.bz2)
md5sums=('83d00e87332a7eab459c58894a7a13ab')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
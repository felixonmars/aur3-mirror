# Contributor: Zephyr
pkgname=kde-service-menu-manager
pkgver=0.4
pkgrel=1
pkgdesc="KDE 4 System Settings module to manage service menus"
arch=('i686' 'x86_64')
depends=('kdelibs' 'qt' 'kdebase-workspace')
makedepends=('cmake')
url="http://www.kde-look.org/content/show.php/Service+Menu+Manager?content=94996&PHPSESSID=bafc10a5dc9c7f4f9cc0bcaf5ee1808e"
license=('GPL')
source=(http://linux.wuertz.org/dists/sid/main/source/kcm-servicemenus_$pkgver.tar.gz)
md5sums=('d7fe4aa352c856c8f272c5b4c7330419')

build() {
  cd $srcdir/kcm-servicemenu/

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

pkgname=kdeplasma-applets-serverstatuswidget
pkgver=1.5.1
pkgrel=1
pkgdesc="A plasmoid application that lets you monitor the status of remote servers"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Server+Status+Widget?content=101336"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('plasma-serverstatuswidget' 'kdeplasma-extra-serverstatuswidget')
replace=('plasma-serverstatuswidget' 'kdeplasma-extra-serverstatuswidget')
source=("http://kde-look.org/CONTENT/content-files/101336-serverstatuswidget-$pkgver.tar.bz2")
md5sums=('2a33c714238edbbd9c4771b973b2d360')

build() {
  mkdir build
  cd build
  cmake ../serverstatuswidget-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
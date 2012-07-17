# Contributor: Nuno Bento <ngpbento@gmail.com>

pkgname=active-app-plasmoid
pkgver=0.2.2
pkgrel=2
pkgdesc="A KDE plasmoid that just shows active application's icon and name"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Active+Application?content=139686"
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'libxtst')
source=("http://kde-look.org/CONTENT/content-files/139686-active-app.tar.gz")
md5sums=('28da4b39d2e3cf2817b37113c09a379a')

build() {
  error "This package has been replaced by 'kdeplasma-applets-activeapp', please install that one instead!"
  return 1
}

#build() {
#  cd $srcdir
#  mkdir build
#  cd build
#  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
#  make
#}

package() {
  cd ${srcdir}/build
  make DESTDIR="$pkgdir" install
}

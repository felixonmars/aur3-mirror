  
# Maintainer: Antonis Geralis 

pkgname=jungle-git
pkgver=r263.cf2fc9c
pkgrel=1
pkgdesc='Jungle is an absolutely awesome video player for managing your videos.'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kde-workspace'
license=('GPL')
depends=('qt5-base' 'qt5-declarative' 'kdelibs4support-git' 'kdbusaddons-git' 'ki18n-git' 'kservice-git' 'baloo-git' 'kdocumentstore-git' 'libtmdbqt-git' 'python2-guessit')
makedepends=('extra-cmake-modules' 'kdoctools' 'git')
optdepends=('gstreamer0.10-ffmpeg: playing media')
conflicts=('jungle')
provides=('jungle')
source=("git://anongit.kde.org/jungle.git")
install=$pkgname.install
sha256sums=('SKIP')

pkgver() {
  cd jungle
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  #cd jungle
  #sed -i 's/find_package(KVariantStore REQUIRED)/find_package(KDocumentStore REQUIRED)/' CMakeLists.txt
}

build() { 
  cd build
  cmake ../jungle \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DLIBEXEC_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

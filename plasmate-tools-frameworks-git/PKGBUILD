# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasmate-tools-frameworks-git
pkgver=r1384.73c78cf
pkgrel=1
pkgdesc='KDE Plasma tools that were in kde-workspace 4.9 (Frameworks version)'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/sdk/plasmate'
license=('LGPL')
depends=('plasma-framework' 'ktexteditor')
makedepends=('extra-cmake-modules' 'git')
conflicts=('plasmate-tools' 'plasmate' 'kdebase-workspace<=4.9.80')
source=('git://anongit.kde.org/plasmate#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd plasmate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasmate \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF \
    -DPLASMATE_BUILD_WITH_KDEVPLATFORM=OFF

  for i in cuttlefish engineexplorer plasmoidviewer; do
    cd $i
    make
    cd ../
  done
}

package() {
  cd build
  for i in cuttlefish engineexplorer plasmoidviewer; do
    cd $i
    make DESTDIR="${pkgdir}" install
    cd ..
  done
}

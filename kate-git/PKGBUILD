# Maintainer: Alexey D. <lq07829icatm at rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kate-git
pkgver=r14958.b1c5e00
pkgrel=1
pkgdesc='An advanced editor component which is used in numerous KDE applications requiring a text editing component'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/applications/kate'
license=('LGPL')
depends=('knewstuff' 'ktexteditor' 'threadweaver' 'kinit' 'kded')
makedepends=('extra-cmake-modules' 'git' 'kdoctools' 'python' 'plasma-framework')
provides=('kate')
conflicts=('kate' 'kdesdk-kate' 'kdebase-kwrite')
install=kate.install
source=('git://anongit.kde.org/kate.git')
md5sums=('SKIP')

pkgver() {
  cd kate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kate \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=kdepimlibs-frameworks-git
pkgver=r17410.f145303
pkgrel=1
pkgdesc="KDE PIM Libraries"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/kdepimlibs'
license=('GPL' 'LGPL')
depends=('gpgme' 'kf5-akonadi-git' 'libical' 'prison' 'qjson' 'kdelibs4support-git' 'kidletime-git' 'kitemmodels-git' 'kinit-git' 
'kemoticons-git')
makedepends=('extra-cmake-modules' 'boost' 'cyrus-sasl' 'git' 'kdoctools-git')
install='kdepimlibs.install'
source=('git://anongit.kde.org/kdepimlibs.git#branch=frameworks')
md5sums=('SKIP')

pkgver() {
  cd kdepimlibs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export PATH="/opt/kf5/bin:$PATH"
  export XDG_DATA_DIRS="/opt/kf5/share:$XDG_DATA_DIRS"
  export CMAKE_PREFIX_PATH="/opt/kf5"

  mkdir build
  cd build
  cmake ../kdepimlibs \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE4_BUILD_TESTS=OFF \
    -DCMAKE_INSTALL_PREFIX=/opt/kf5
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

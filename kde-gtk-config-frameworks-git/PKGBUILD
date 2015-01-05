# PKGBUILD From KaOS
# Maintainer: maz-1 <loveayawaka@gmail.com>

pkgname=kde-gtk-config-frameworks-git
_gitname=kde-gtk-config
pkgver=r368.8c9d8e9
pkgrel=1
pkgdesc="kcm configuration dialog to adapt GTK applications appearance to your taste under KF5"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/extragear/base/kde-gtk-config"
license=('LGPL')
depends=('karchive-git' 'kauth-git' 'kcmutils-git' 'kconfigwidgets-git' 'knewstuff-git')
makedepends=('extra-cmake-modules' 'git' 'gtk2' 'gtk3')
conflicts=('kf5-kde-gtk-config' 'kcm-gtk')
replaces=('kf5-kde-gtk-config')
provides=('kf5-kde-gtk-config')
source=("git://anongit.kde.org/kde-gtk-config.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd $_gitname
  rm -rf build ; mkdir build
  
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DLIBEXEC_INSTALL_DIR=lib \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DQML_INSTALL_DIR=/usr/lib/qt/qml \
        -DPLUGIN_INSTALL_DIR=/usr/lib/qt/plugins \
        -DBUILD_TESTING=OFF ..
  make
}

package() {
  cd $_gitname/build
  
  make DESTDIR="$pkgdir" install
}

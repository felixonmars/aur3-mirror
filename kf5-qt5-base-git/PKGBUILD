# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kf5-qt5-base-git
pkgver=v5.1.0.beta1.17.g3a770f5
pkgrel=1
pkgdesc="A cross-platform application and UI framework"
arch=('i686' 'x86_64')
url="http://qt-project.org/"
license=('GPL3' 'LGPL')
depends=('dbus' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-image'
         'libxext' 'inputproto' 'glib2')
makedepends=('git' 'gdb')
optdepends=('qtchooser: set the default Qt toolkit')
provides=('kf5-qt5-base')
options=('!libtool')
source=(git://gitorious.org/qt/qtbase.git
        'qtchooser.conf' 'ld.conf')
md5sums=('SKIP'
         '35302f72e83a6b92d4851d863250e9bc'
         '3d6af18efebab351a19b8a9d61eee984')

pkgver() {
  cd qtbase
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd qtbase
  git checkout dev
  
  sed -i "s|-O2|${CXXFLAGS}|" mkspecs/common/{g++,gcc}-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" mkspecs/common/gcc-base.conf
}

build() {
  cd qtbase
  ./configure -prefix /opt/kf5 \
    -opensource -confirm-license \
    -developer-build \
    -nomake tests \
    -nomake demos \
    -nomake examples \
    -dbus -no-separate-debug-info \
    -xcb \
    -qpa xcb \
    -no-gtkstyle
  make
}

package() {
  cd qtbase
  make INSTALL_ROOT="${pkgdir}" install

  install -Dm644 "${srcdir}"/qtchooser.conf \
    "${pkgdir}"/etc/xdg/qtchooser/kf5.conf
  
  install -Dm644 "${srcdir}"/ld.conf \
    "${pkgdir}"/etc/ld.so.conf.d/kf5.conf
}

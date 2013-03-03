# Maintainer: speps <speps at aur dot archlinux dot org>

_uname=lyricat
pkgbase=hotot-git
pkgname=hotot-git
true && pkgname=('hotot-data-git' 'hotot-gtk2-git' 'hotot-gtk3-git' 'hotot-qt-git' 'hotot-qt5-git')
#true && pkgname+=('hotot-kde-git')
pkgver=20130303
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca)."
arch=('any')
url="http://www.hotot.org/"
license=('LGPL3')
makedepends=('git' 'cmake' 'intltool' 'python2' 'qt5-webkit')
#makedepends+=('kdebase-runtime')
install="hotot-git.install"

_gitroot="https://github.com/$_uname/Hotot.git"
_gitname="hotot"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_GTK=ON \
          -DWITH_GTK2=ON \
          -DWITH_GTK3=ON \
          -DWITH_QT=ON \
          -DWITH_QT5=ON \
          -DWITH_KDE=OFF \
          -DWITH_CHROME=OFF \
          -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package_hotot-data-git() {
  true && depends=('hicolor-icon-theme')
  true && provides=("${pkgname/-git}")
  true && conflicts=("${pkgname/-git}")
  cd "$srcdir/$_gitname-build"

  DESTDIR="$pkgdir/" cmake -P misc/cmake_install.cmake
  DESTDIR="$pkgdir/" cmake -P po/cmake_install.cmake

  # remove google analytics tracking code (tnx to ianux)
  find "$pkgdir" -name hotot.js -exec \
    sed -i '/\/\/ 7. run track code/,+12d' {} \;
}

package_hotot-qt-git() {
  true && arch=('i686' 'x86_64')
  true && depends=('hotot-data-git' 'qtwebkit')
  true && provides=("${pkgname/-git}")
  true && conflicts=("${pkgname/-git}")
  cd "$srcdir/$_gitname-build/qt"

  DESTDIR="$pkgdir/" cmake -P cmake_install.cmake
}

package_hotot-qt5-git() {
  true && arch=('i686' 'x86_64')
  true && depends=('hotot-data-git' 'qt5-webkit')
  true && provides=("${pkgname/-git}")
  true && conflicts=("${pkgname/-git}")
  cd "$srcdir/$_gitname-build/qt5"

  DESTDIR="$pkgdir/" cmake -P cmake_install.cmake
}

#package_hotot-kde-git() {
#  true && arch=('i686' 'x86_64')
#  true && depends=('hotot-data-git' 'kdebase-runtime')
#  true && provides=("${pkgname/-git}")
#  true && conflicts=("${pkgname/-git}")
#  cd "$srcdir/$_gitname-build/qt"
#
#  DESTDIR="$pkgdir/" cmake -P cmake_install.cmake
#}

package_hotot-gtk2-git() {
  true && depends=('hotot-data-git' 'pywebkitgtk' 'python2-notify'
                   'python2-keybinder2' 'python2-dbus' 'desktop-file-utils')
  true && optdepends=('libappindicator: unity menubar integration')
  true && provides=("${pkgname/-git}" 'hotot')
  true && conflicts=("${pkgname/-git}" 'hotot')
  cd "$srcdir/$_gitname-build"

  DESTDIR="$pkgdir/" cmake -P hotot/cmake_install.cmake

  # bin
  install -Dm755 scripts/${pkgname/-git} \
    "$pkgdir/usr/bin/${pkgname/-git}"

  # desktop file
  install -Dm644 misc/${pkgname/-git}.desktop \
    "$pkgdir/usr/share/applications/${pkgname/-git}.desktop"
}

package_hotot-gtk3-git() {
  true && depends=('hotot-data-git' 'python2-gobject' 'python2-dbus'
                   'python2-pycurl' 'webkitgtk3' 'desktop-file-utils')
  true && optdepends=('libappindicator: unity menubar integration')
  true && provides=("${pkgname/-git}")
  true && conflicts=("${pkgname/-git}")
  cd "$srcdir/$_gitname-build"

  DESTDIR="$pkgdir/" cmake -P hotot-gir/cmake_install.cmake

  # bin
  install -Dm755 scripts/${pkgname/-git} \
    "$pkgdir/usr/bin/${pkgname/-git}"

  # desktop file
  install -Dm644 misc/${pkgname/-git}.desktop \
    "$pkgdir/usr/share/applications/${pkgname/-git}.desktop"
}

# vim:set ts=2 sw=2 et:

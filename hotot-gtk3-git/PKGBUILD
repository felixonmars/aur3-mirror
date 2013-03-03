# Maintainer: speps <speps at aur dot archlinux dot org>

_uname=lyricat
_commit=e0c78bf
pkgname=hotot-gtk3-git
pkgver=20130303
pkgrel=1
pkgdesc="A lightweight & open source microblogging software (twitter identi.ca). Gtk3 frontend."
arch=('any')
url="http://www.hotot.org/"
license=('LGPL3')
depends=('hotot-data-git' 'python2-gobject' 'python2-dbus'
         'python2-pycurl' 'webkitgtk3' 'desktop-file-utils')
makedepends=('git' 'cmake' 'intltool' 'python2')
optdepends=('libappindicator: unity menubar integration')
provides=("${pkgname/-git}")
conflicts=("${pkgname/-git}")
install="$pkgname.install"

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
          -DWITH_GTK2=OFF \
          -DWITH_GTK3=ON \
          -DWITH_QT=OFF \
          -DWITH_QT5=OFF \
          -DWITH_KDE=OFF \
          -DWITH_CHROME=OFF \
          -DPYTHON_EXECUTABLE=/usr/bin/python2
  make
}

package_hotot-gtk3-git() {
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

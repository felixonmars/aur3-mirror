# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

pkgbase=lib32-qtcurve
pkgname=lib32-qtcurve-git
true && pkgname=(lib32-qtcurve-utils-git lib32-qtcurve-qt4-git
  lib32-qtcurve-gtk2-git)
_realver=1.8.18
pkgver=1.8.18.0.239.gfda0450
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk. Multilib.'
arch=('x86_64')
url="https://github.com/QtCurve/qtcurve"
license=('LGPL')
groups=('qtcurve')
makedepends=('git' 'cmake' 'gcc-multilib' 'lib32-gtk2'
  'lib32-qt4' 'lib32-libxcb')
source=(qconfig.h QtConfig)
md5sums=('89eaf62c5271cd6c268b926bb752a744'
         'a1f0a57f5ba462857773e0e6d73cfffd')
options=('strip' 'debug')

_gitname="qtcurve"

_gitroot="git://anongit.kde.org/qtcurve.git"
_gitref="master"

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    git clean -fdx
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
    git clean -fdx
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitref from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitref" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
}

pkgver() {
  local outfile=/dev/null
  [[ -e /dev/tty ]] && outfile=/dev/tty
  (_fetch_git &> ${outfile})
  cd "$srcdir/$_gitname"

  git describe | sed -e 's/-/.0./' -e 's/-/./g'
}

build() {
  (_fetch_git)

  mkdir -p QtCore
  cp qconfig.h QtCore
  cp QtConfig QtCore

  # export multilib parameters
  # and QT_BUILD_KEY workaround
  export CC="gcc -m32 -I$srcdir -I$srcdir/QtCore"
  export CXX="g++ -m32 -I$srcdir -I$srcdir/QtCore"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd qtcurve
  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT_PLUGINS_DIR=/usr/lib32/qt/plugins \
    -DQT_LIBRARY_DIR=/usr/lib32 \
    -DLIB_INSTALL_DIR=/usr/lib32 \
    -DQTC_QT4_ENABLE_KDE=Off \
    -DENABLE_GTK2=On \
    -DENABLE_QT5=Off

  make
}

package_lib32-qtcurve-qt4-git() {
  depends=(lib32-libxcb lib32-qtcurve-utils-git=${pkgver} lib32-qt4)
  provides=(lib32-qtcurve-qt4=${_realver})
  conflicts=(lib32-qtcurve-qt4 lib32-qtcurve-qt4-debug)

  make -C qtcurve/build/qt4 DESTDIR="$pkgdir" install
}

package_lib32-qtcurve-gtk2-git() {
  depends=(lib32-libxcb lib32-qtcurve-utils-git=${pkgver} lib32-pango
    lib32-cairo lib32-gtk2 qtcurve-gtk2-git)
  provides=(lib32-qtcurve-gtk2=${_realver})
  conflicts=(lib32-qtcurve-gtk2 lib32-qtcurve-gtk2-debug)

  make -C qtcurve/build/gtk2/style DESTDIR="$pkgdir" install
  make -C qtcurve/build/lib/cairo DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share"
}

package_lib32-qtcurve-utils-git() {
  depends=(lib32-libx11 lib32-libxcb)
  provides=(lib32-qtcurve-utils=${_realver})
  conflicts=(lib32-qtcurve-utils lib32-qtcurve-utils-debug)

  make -C qtcurve/build/lib/utils DESTDIR="$pkgdir" install
}

# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: xduugu

pkgname=qtcurve-qt5
_realver=1.8.15
pkgver=20130301
pkgrel=1
pkgdesc='A configurable set of widget styles for KDE and Gtk. Qt5 experimental port version. Not finished, with known bugs. Patch/help welcome.'
arch=('i686' 'x86_64')
url="http://craigd.wikispaces.com/"
license=('GPL')
groups=('qtcurve')
depends=('qt5-base')
makedepends=('cmake')
source=()
md5sums=()

_gitname="qtcurve-qt5"

_gitroot="git://github.com/yuyichao/qtcurve-qt5.git"
_gitref=master

build() {
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

  mkdir -p build
  cd build

  cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  make DESTDIR="$pkgdir/" install
}

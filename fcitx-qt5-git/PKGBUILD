# Maintainer: Yichao Yu <yyc1992@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>

_pkgname=fcitx-qt5
pkgname=${_pkgname}-git
pkgver=1.0.0.2.gb706cec
pkgrel=1
epoch=1
pkgdesc="QT5 IM Module for Fcitx"
arch=('i686' 'x86_64')
url="http://fcitx-im.org/"
license=('GPL')
depends=('fcitx-git' 'qt5-base')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('fcitx-qt5')
conflicts=('fcitx-qt5')
options=(strip debug)

_gitname=fcitx-qt5

_gitroot=git://github.com/fcitx/fcitx-qt5/
_gitref=master

_fetch_git() {
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    msg "Fetching branch $_gitref from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitref:$_gitref" --
    msg "Checking out branch $_gitref..."
    git checkout "$_gitref" --
    git reset --hard "$_gitref"
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

  git describe | sed -e 's/-/./g'
}

build() {
  (_fetch_git)

  msg "Creating make environment..."
  mkdir -p "$srcdir/$_gitname/build"
  cd "$srcdir/$_gitname/build"
  [[ -f CMakeCache.txt ]] && rm -v CMakeCache.txt

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  make install DESTDIR="${pkgdir}"
}

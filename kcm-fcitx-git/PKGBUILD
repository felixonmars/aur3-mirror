#Contributor: poplarch <poplarch@gmail.com>
_pkgname=kcm-fcitx
pkgname=$_pkgname-git
pkgver=0.5.0.3.g224f9d4
pkgrel=2
epoch=1
pkgdesc="KDE Config Module for Fcitx"
arch=('i686' 'x86_64')
url="https://github.com/fcitx/kcm-fcitx"
license=('GPL')
depends=('fcitx-git' 'fcitx>=4.2.8' 'fcitx-qt5' 'qt5-base'
         'knewstuff' 'kio' 'kcompletion' 'kitemviews' 'kconfigwidgets'
         'kwidgetsaddons' 'ki18n' 'kcoreaddons')
makedepends=('git' 'cmake' 'gettext' 'coreutils' 'sh')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('strip' 'debug')

_gitname="kcm-fcitx"

_gitroot="git://github.com/fcitx/kcm-fcitx.git"
_gitref="master"

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

build(){
  (_fetch_git)

  msg "Creating make environment..."
  mkdir -p "$srcdir/$_gitname-build"

  msg "Starting make..."
  cd "$srcdir/$_gitname-build"
  # export CC=clang
  # export CXX=clang++
  # rm CMakeFiles/2.*/CMakeC{,XX}Compiler.cmake &> /dev/null || true
  [[ -f CMakeCache.txt ]] && rm -v CMakeCache.txt
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

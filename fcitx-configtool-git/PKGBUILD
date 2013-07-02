# Maintainer: Yichao Yu <yyc1992 AT gmail.com>
# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-configtool-git
pkgver=0.4.7
pkgrel=1
epoch=1
pkgdesc="Fcitx Config Tool"
url="http://code.google.com/p/fcitx"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk3' 'fcitx')
makedepends=('git' 'cmake')
options=('strip' 'debug')
conflicts=('fcitx-config' 'fcitx-configtool')
provides=('fcitx-config' 'fcitx-configtool')
install=fcitx-configtool.install

_gitname=fcitx-configtool

_gitroot=git://github.com/fcitx/fcitx-configtool/
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

build() {
  (_fetch_git)

  msg "Creating make environment..."
  mkdir -p "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  [[ -f CMakeCache.txt ]] && rm -v CMakeCache.txt
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_GTK2=Off -DENABLE_GTK3=On \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

  make
}

package(){
  cd "$srcdir/$_gitname-build"

  make DESTDIR="${pkgdir}" install
}

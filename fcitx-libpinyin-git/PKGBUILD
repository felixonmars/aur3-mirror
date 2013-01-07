# Maintainer: Yichao Yu <yyc1992 AT gmail.com>
# Contributor: poplarch <poplarch@gmail.com>

pkgbase=fcitx-libpinyin
pkgname=$pkgbase-git
pkgver=20130102
pkgrel=1
pkgdesc="Libpinyin Wrapper for Fcitx."
arch=('i686' 'x86_64')
url="https://github.com/fcitx/fcitx-libpinyin"
license=('GPL')
depends=('fcitx-git' 'fcitx>=4.2.7' 'libpinyin>=0.6.92')
makedepends=('git' 'cmake' 'intltool')
provides=("$pkgbase")
conflicts=("$pkgbase")

_gitname="fcitx-libpinyin"

_gitroot="git://github.com/fcitx/fcitx-libpinyin.git"
_gitbranch="master"

build(){
  cd "$srcdir"

  if [ -d "$srcdir/$_gitname/.git" ]; then
    cd "$_gitname"
    msg "Reset current branch"
    git reset --hard HEAD
    msg "Fetching branch $_gitbranch from $_gitroot..."
    git fetch --force --update-head-ok \
      "$_gitroot" "$_gitbranch:$_gitbranch"
    msg "Checking out branch $_gitbranch..."
    git checkout "$_gitbranch"
    git reset --hard "$_gitbranch"
    msg "The local files are updated."
  else
    msg "Cloning branch $_gitbranch from $_gitroot to $_gitname..."
    git clone --single-branch --branch "$_gitbranch" \
      "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  msg "GIT checkout done or server timeout"

  msg "Creating make environment..."
  mkdir -p "$srcdir/$_gitname-build"

  msg "Starting make..."
  cd "$srcdir/$_gitname-build"
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}

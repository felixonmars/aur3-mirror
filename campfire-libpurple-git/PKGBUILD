# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Sean Escriva <sean.escriva@gmail.com>
pkgname=campfire-libpurple-git
pkgver=20130404
pkgrel=1
pkgdesc="Campfire libpurple plugin for pidgin/finch"
arch=('any')
url="https://github.com/jrfoell/campfire-libpurple"
license=('unknown')
groups=()
depends=('glibc' 'libpurple')
makedepends=('git')
provides=('campfire-libpurple')
conflicts=('campfire-libpurple')
source=()
md5sums=()

_gitroot="git://github.com/jrfoell/campfire-libpurple.git"
_gitname="master"

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
  git clone --depth 1 "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  LIBNAME=libcampfire.so
  PLUGIN_DIR_PURPLE=$(pkg-config --variable=plugindir purple)
  DATA_ROOT_DIR_PURPLE=$(pkg-config --variable=datarootdir purple)
  install -D "$LIBNAME" "$pkgdir$PLUGIN_DIR_PURPLE/$LIBNAME"
  install -D --mode=0644 campfire16.png "$pkgdir$DATA_ROOT_DIR_PURPLE"/pixmaps/pidgin/protocols/16/campfire.png
  install -D --mode=0644 campfire22.png "$pkgdir$DATA_ROOT_DIR_PURPLE"/usr/share/pixmaps/pidgin/protocols/22/campfire.png
  install -D --mode=0644 campfire48.png "$pkgdir$DATA_ROOT_DIR_PURPLE"/usr/share/pixmaps/pidgin/protocols/48/campfire.png
}

pkgver () {
  cd "$srcdir/$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Vaquerito <wave.69@libero.it>
pkgname=gnome-shell-extension-updater-git
pkgver=20120528
pkgrel=1
pkgdesc="Check updates from https://extensions.gnome.org"
arch=(any)
url="https://github.com/eonpatapon/gnome-shell-extension-updater"
license=('GPL')
depends=('gnome-common' 'glib2' 'gnome-shell-extension-common-git')
if test "$CARCH" == x86_64; then
    depends+=('lib32-glib2')
  fi
makedepends=('git')
source=()

_gitroot="git://github.com/eonpatapon/gnome-shell-extension-updater.git"
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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

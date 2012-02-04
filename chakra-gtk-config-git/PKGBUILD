# Contributor: vicky91 <vickypaiers@gmail.com>
pkgname=chakra-gtk-config-git
pkgver=20111217
pkgrel=1
pkgdesc="A K Control module for change the visual apperance of the Gtk apps and bundles"
arch=('i686' 'x86_64')
url="http://gitorious.org/chakra/chakra-gtk-config"
license=('GPL')
depends=('kdelibs')
makedepends=('git' 'automoc4' 'cmake' 'gettext')
install=

_gitroot=https://git.gitorious.org/chakra/chakra-gtk-config.git
_gitname=chakra-gtk-config

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make

}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

# Maintainer: Tom Kuther <gimpel@sonnenkinder.org>
pkgname=krunner-appmenu-git
pkgver=20120209
pkgrel=3
pkgdesc="krunner using appmenu"
arch=('i686' 'x86_64')
url="git://anongit.kde.org/scratch/afiestas/appmenu.git"
license=('GPL')
depends=('libdbusmenu-qt' 'kdelibs' 'appmenu-qt')
makedepends=('git' 'cmake' 'automoc4')
provides=('krunner-appmenu')
conflicts=('krunner-appmenu')
optdepends=('oxygen-appmenu' 'kdebase-workspace-appmenu')
source=()

_gitroot=git://anongit.kde.org/scratch/afiestas/appmenu.git
_gitname=appmenu

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

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/$_gitname-build/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

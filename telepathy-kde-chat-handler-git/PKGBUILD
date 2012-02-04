# Maintainer: laloch <laloch@atlas.cz>
pkgname=telepathy-kde-chat-handler-git
pkgver=20110831
pkgrel=1
pkgdesc="Telepathy text chat handler"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/network/telepathy/telepathy-chat-handler"
license=('GPL2')
groups=('telepathy-kde-git')
depends=('kdebase-runtime' 'telepathy-qt4')
makedepends=('git' 'cmake' 'automoc4')
provides=('telepathy-kde-text-ui')
conflicts=('telepathy-kde-text-ui')

_gitroot=git://anongit.kde.org/telepathy-chat-handler
_gitname=telepathy-chat-handler

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin --depth=1
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname" --depth=1
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake $srcdir/$_gitname \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

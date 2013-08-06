# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=rbdoom3bfg-git
pkgver=20130805
pkgrel=1
pkgdesc="Doom 3: BFG engine with native 64-bit support, SDL, and OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
depends=('doom3bfg-data' 'openal' 'sdl')
makedepends=('cmake' 'git')
source=('rbdoom3bfg.desktop'
        '0001-game_data_location.patch')
sha256sums=('60ac24c806f46949f0fd50a6b62a99399afde1ba288ad55fc47f337dcda4ab9a'
            '0648e7602184fe7bd82d7e210220a804627217be05ae81a046b89f0595c57259')

_gitroot=git://github.com/RobertBeckebans/RBDOOM-3-BFG.git
_gitname=RBDOOM-3-BFG

prepare() {
  cd "$srcdir"
  msg "Starting Git clone or pull..."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "Git clone/pull done or server timeout"
}

build() {
  cd "$srcdir/$_gitname"
  patch -p1 < "$srcdir"/0001-game_data_location.patch

  mkdir build
  cd build
  cmake -G Unix\ Makefiles -DCMAKE_BUILD_TYPE=RelWithDebInfo -DSDL2=OFF ../neo
  make
}

package() {
  cd "$srcdir/$_gitname/build"

  install -Dm755 RBDoom3BFG "$pkgdir"/usr/bin/rbdoom3bfg

  install -Dm644 "${srcdir}"/rbdoom3bfg.desktop "$pkgdir"/usr/share/applications/rbdoom3bfg.desktop
}

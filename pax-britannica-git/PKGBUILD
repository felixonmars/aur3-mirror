# Maintainer: Calimero <calimeroteknik@free.fr>

pkgname=pax-britannica-git
pkgver=20120429
pkgrel=1
pkgdesc="A one-button real-time strategy game for up to 4 players"
arch=('i686' 'x86_64')
url="http://paxbritannica.henk.ca/"
license=("MIT")
depends=('glfw' 'lua')
conflicts=("pax-britannica")

_gitroot="https://github.com/henkboom/pax-britannica.git"
_gitname="pax-britannica"

build() {
  cd "$srcdir"

  [ -e $_gitname ] || git clone $_gitroot $_gitname
  cd $_gitname
  git submodule update --init

  # fix
  sed -i 's|#include EXTRA_LOADERS|#include "../extra_loaders.h"|' dokidoki-support/minlua.c

  export EXTRA_LDFLAGS="$EXTRA_LDFLAGS -ldl -lrt"

  make clean
  make linux

  # .desktop file
  cat > "$srcdir/pax-britannica.desktop" <<-END 
  [Desktop Entry]
  Name=Pax Britannica
  GenericName=Pax Britannica
  Comment=A one-button real-time strategy game for up to 4 players
  Exec=pax-britannica
  Terminal=false
  Type=Application
  Categories=Game;
	END
}

package() {
  # Create pkgdir folders
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/pax-britannica"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/lib/pax-britannica"

  # Copy game
  cp -r "$srcdir"/pax-britannica/{dokidoki,*.lua,scripts,components,sprites,audio,pax-britannica} "$pkgdir/usr/lib/pax-britannica/"
  rm -rf "$pkgdir/usr/lib/pax-britannica/dokidoki/.git"
  cp "$srcdir/pax-britannica/license.txt" "$pkgdir/usr/share/licenses/pax-britannica/"
  cp "$srcdir/pax-britannica.desktop" "$pkgdir/usr/share/applications/"
  ln -sf "/usr/lib/pax-britannica/pax-britannica" "$pkgdir/usr/bin/pax-britannica"
}

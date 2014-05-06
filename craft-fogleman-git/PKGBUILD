# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=craft-fogleman-git
_gitname=Craft
pkgver=736.fe3e7b3
pkgrel=6
pkgdesc="A Minecraft clone in C and Python with multiplayer support"
arch=('i686' 'x86_64')
url="http://www.michaelfogleman.com/craft/"
license=('MIT')
depends=('glew' 'curl' 'python2-requests')
makedepends=('git' 'cmake')
source=('git://github.com/fogleman/Craft.git'
        'craft.desktop'
        'craft_icon.png'
        'craft'
        'craft-server'
        )
md5sums=('SKIP'
         '3f9ad8e597f9654d9db3beeb53051ebd'
         '3b070adce3e98082a87e4c2bc50515d5'
         '3d89922150d69586aa8d6e021c9ab154'
         '4682aa6fe1d5592b500236f35fe9186c')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  cmake .
  make
  
  gcc -std=c99 -O3 -shared -o world -I src -fPIC -I deps/noise deps/noise/noise.c src/world.c # needed for Python server
}

package() {
  cd $_gitname
  install -Dm755 craft "$pkgdir/usr/bin/craft-bin"
  install -Dm755 $srcdir/craft "$pkgdir/usr/bin/craft"
  install -Dm755 $srcdir/craft-server "$pkgdir/usr/bin/craft-server"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/craft/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/craft/README"

  mkdir -p "$pkgdir/usr/share/craft"
  cp -pr shaders textures "$pkgdir/usr/share/craft/"
  cp -p world *.py "$pkgdir/usr/share/craft/"

  install -Dm644 $srcdir/craft_icon.png $pkgdir/usr/share/icons/craft_icon.png
  install -Dm644 $srcdir/craft.desktop $pkgdir/usr/share/applications/craft.desktop
}

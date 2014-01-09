# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=fistfulofbeef
pkgver=208.eafb42c
pkgrel=1
pkgdesc="FoB is a game where you swing bulls to defend yourself against incoming hordes of...other bulls!"
url="http://www.moddb.com/games/fistful-of-beef"
arch=('any')
license=('MIT')
depends=('love07')
makedepends=('git')
source=('git+https://github.com/LOVE-Party/Love-LD18.git'
        $pkgname
        $pkgname.desktop)
md5sums=('SKIP'
         '062262594784e0b0fc98d9ea09c8474c'
         '424344af8fccaaa6a33a9d987f7e80d6')

build() {
   cd $srcdir/Love-LD18
   sh makelove.sh
}

package() {
   cd $srcdir/Love-LD18
   # Executable
   install -Dm755 fistfulofbeef.love $pkgdir/usr/share/games/$pkgname/$pkgname.love

   # License
   install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

   # Desktop icon
   install -Dm644 gfx/comboicon.png $pkgdir/usr/share/pixmaps/$pkgname.png
   cd ..
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

   # Launcher
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

pkgver() {
   cd $srcdir/Love-LD18
   echo $(git rev-list --count master).$(git rev-parse --short master)
}
# Maintainer: Tillmann Karras <tilkax@gmail.com>
pkgname=dynablaster-revenge
_pkgname=dynablaster_revenge
pkgver=1.0.1
pkgrel=1
pkgdesc='3D remake of the original Bomberman/Dynablaster game'
arch=('i686' 'x86_64')
url='https://dynablaster.titandemo.de/'
# authors contacted: no explicit license
license=('unknown')
depends=('qt4' 'sdl2')
backup=("opt/$pkgname/data/game.ini"
        "opt/$pkgname/data/server.ini")
source=("http://prods.j-chaos.net/${_pkgname}.zip"
        "$pkgname"
        "$pkgname-server"
        "$pkgname.desktop"
        "$pkgname.service")
sha256sums=('83ea853be15bb0a2d95a214b2d6888de06456fb8d0f57ebb2f4a1422c85a0e46'
            'c9d1473058c48bf7d48651f12faaf4fc6464f2658570e831921a10116ce7bc0c'
            '1d1bdf7a8d2b432cf99476e3215d1d1aaaf1ec28cecbd0640d2e142afa0ecb0f'
            '7ad3277ec002fb7ec271e480510b0fee77ee05d5522cde5fa4a2ed0e05ac2c60'
            '871d5a4dc1771cc6a6e2d99129cda9105116d8dd8b7cd6a250ab08dacb9bf2f0')

prepare() {
  cd "$srcdir/$_pkgname"
  rm *.exe *.dll
  case $CARCH in
    i686)
      mv linux/dynablaster_x86 dynablaster
      mv linux/server_x86 server
      ;;
    x86_64)
      mv linux/dynablaster_x64 dynablaster
      mv linux/server_x64 server
      ;;
  esac
  mv linux/readme.linux .
  rm -r linux
}

package() {
  cd "$pkgdir"
  mkdir -p opt usr/bin
  cp -r --preserve=mode,timestamp "$srcdir/$_pkgname" "opt/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "usr/share/applications/${pkgname}.desktop"
  install -Dm644 "$srcdir/$pkgname.service" "usr/lib/systemd/system/${pkgname}.service"
  install -Dm755 "$srcdir/$pkgname" "usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-server" "usr/bin/$pkgname-server"
}

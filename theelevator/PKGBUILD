# Maintainer: AlexanderR <alexander r at gmx com>

pkgname=theelevator
pkgver=1
pkgrel=1
pkgdesc="Detective visual novel, based in future."
arch=('any')
url='http://elevator.cyanide-tea.net/'
license=('custom')
depends=('renpy')
options=(!strip)
source=("The Elevator-linux-x86.tar.bz2::http://elevator.cyanide-tea.net/dl/download.php?f=The%20Elevator-linux-x86.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        python2.patch)

build() {
  cd "$srcdir/The Elevator-linux-x86"

  patch -p1 -i ../python2.patch
}

package() {
  cd "$srcdir/The Elevator-linux-x86"

  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r game/* "$pkgdir/usr/share/$pkgname"
  install -m644 elevator.py "$pkgdir/usr/share/$pkgname"

  install -D -m644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
  install -D -m644 README.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -D -m755 "$srcdir/${pkgname}.sh" "$pkgdir/usr/bin/$pkgname"

  install -D -m644 icon.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}

md5sums=('50dbd087415e9194511c49939de3986f'
         '287126b01ad55e4605d7de20b1575932'
         'c4948aaf9af2a1cc1bb3985f7d691a62'
         '7e4107cc434aebc7149f8be01f9da3d0')

# vim:set ts=2 sw=2 et:

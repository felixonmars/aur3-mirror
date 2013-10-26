# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gamelv
pkgver=1.01
pkgrel=3
pkgdesc="A point-and-click Adventure Game in Post Soviet Environment(english and latvian speech)"
arch=('any')
url="https://github.com/snauts/GameLV"
license=('CC-BY')
depends=('gamelv-engine-git')
conflicts=('gamelv-git')
source=(http://piepe.lv/game-lv/assemble.tgz
        $pkgname
        $pkgname.desktop)
md5sums=('07b16618a42b7962ed672ad65445c99c'
         'e1b1c12856c1f11899a6356a1973d63e'
         'd96531af9117e2da56e4d434b64871a5')

package() {
  cd $srcdir/assemble

  # Uncomment next line for latvian speech instead of english
  # sed "s/\-en//" *.lst -i

  # Data
  mkdir -p $pkgdir/usr/share/games/$pkgname
  cp -r * $pkgdir/usr/share/games/$pkgname

  # Desktop icon
  install -Dm644 icon.bmp $pkgdir/usr/share/pixmaps/$pkgname.bmp
  cd ..
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Start file
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}

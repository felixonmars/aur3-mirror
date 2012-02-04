# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=kreiselball-demo
pkgver=1.0.1
_pkgname=KreiselBall
pkgrel=1
pkgdesc="Control a ball by turning the world in a classic game play"
arch=('i686' 'x86_64')
url="http://kreiselball.com/"
license=('custom')
depends=('sdl' 'sdl_mixer')
makedepends=('unzip')
source=(http://kreiselball.com/files/KreiselBall-1.0.1-EN-Demo.zip
        kreiselball-demo.desktop
        kreiselball-demo)
md5sums=('4d5b981e656d0f5741abd80df5227750'
         '05fd64c7bd36b07c4d7c410e415abc10'
         '91a1ea28435eced8d66d16b7ce96d2e5')


build () {
  # Extract archive
  cd $srcdir || return 1
  bsdtar -x -f $_pkgname-$pkgver-EN-Demo.zip || return 1
  bsdtar -x -f $_pkgname-$pkgver-EN-Demo/Linux/$_pkgname-$pkgver-Demo.tar.gz || return 1

  # Create pkgdir folders
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/{applications,games/kreiselball-demo,icons}
  install -d $pkgdir/usr/share/licenses/$pkgname

  # Install files
  cd $_pkgname-$pkgver-Demo/

  # game folder
  cp -r * $pkgdir/usr/share/games/$pkgname/

  # executable
  install -Dm755 $startdir/$pkgname $pkgdir/usr/bin/

  # icon/.desktop
  install -Dm644 data/images/player.png $pkgdir/usr/share/icons/$pkgname.png
  install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/
}

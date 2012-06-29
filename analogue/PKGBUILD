# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=analogue
pkgver=1.2
pkgrel=1
pkgdesc="Analogue: A Hate Story"
arch=('i686' 'x86_64')
url="http://ahatestory.com/"
license=('custom')
depends=()
install=analogue.install
source=("Analogue-$pkgver-linux-x86.tar.bz2"
        "dlc1.rpa"
        "Analogue.desktop"
        "Analogue-256.png"
        "Analogue-128.png"
        "Analogue-48.png"
        "Analogue-32.png"
        "Analogue-16.png")
sha1sums=('db8ac00dcce3df311c1e9ce93e11e01eea8c37ee'
          'c57bb2b56670a166b5664d37c941899dfc1ed15e'
          '70103ed90043becbadb6ce179a5a061e8cd103e4'
          '282cc9dfdb0da3529f7fcc9d7fedb11374132e49'
          'e4f9a5f1489282508759fdb0b3db06d7bee20c58'
          '13c0739256c4958ea2e18b0d856f828ca079e8ec'
          'c054fd0f9a0271b41253ccc491e7daee529ec872'
          '24cd8907090463ecbefaec5e0538502439d81486')

package() {
  cd "$srcdir"
  install -dm0755 "$pkgdir/opt"
  cp -a "Analogue-$pkgver-linux-x86" "$pkgdir/opt/analogue"

  install -Dm0644 "dlc1.rpa" "$pkgdir/opt/analogue/game/dlc1.rpa"

  install -Dm0644 "Analogue.desktop" "$pkgdir/usr/share/applications/Analogue.desktop"
  for size in 256 128 48 32 16; do
    install -Dm0644 "Analogue-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/Analogue.png"
  done
}

# vim:set ts=2 sw=2 et:

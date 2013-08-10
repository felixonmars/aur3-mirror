# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=analogue
pkgver=1.3
pkgrel=5
pkgdesc="Analogue: A Hate Story"
arch=('i686' 'x86_64')
url="http://ahatestory.com/"
license=('custom')
depends=()
install=analogue.install
source=("Analogue-$pkgver-linux-x86.tar.bz2"
        "dlc1.rpa"
        # Yes, you need to download these yourself.
        "analogue.bin.sh"
        "analogue.desktop"
        "analogue-256.png"
        "analogue-128.png"
        "analogue-48.png"
        "analogue-32.png"
        "analogue-16.png")
sha1sums=('2286cac8b2b773fc5027391aeb081c5257e32c02'
          '55bf01404df8752843eee4adfa2c9b31ceaba864'
          'd4c76424a24ec397197334fcb41d82114ed63a92'
          '3423a2d084986efb6dac6066388f96be31782e7d'
          'cce341e2d832c53881a2692ec5735d61c54b3edb'
          'c3e23b21a689afe736b963d11aa05907a4f97544'
          '78e893061f85679c71ba719df6bce1ba9a13f385'
          '7fca88c907f10ef8934c0e75bf062ae029c59ba4'
          '54df2190e4a7742fe697e9bd8ff7b17176401f9b')

package() {
  cd "$srcdir"
  install -dm0755 "$pkgdir/opt"
  cp -a "Analogue-$pkgver-linux-x86" "$pkgdir/opt/analogue"
  install -Dm0644 "dlc1.rpa"         "$pkgdir/opt/analogue/game/dlc1.rpa"
  install -Dm0755 "analogue.bin.sh"  "$pkgdir/usr/bin/analogue"
  install -Dm0644 "analogue.desktop" "$pkgdir/usr/share/applications/analogue.desktop"
  for size in 256 128 48 32 16; do
    install -Dm0644 "analogue-$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/analogue.png"
  done
}

# vim:set ts=2 sw=2 et:

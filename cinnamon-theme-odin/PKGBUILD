# Maintainer: Daniel Leining <daniel@the-beach.co>

pkgname=cinnamon-theme-odin
_file=RM1C-KITZ-QATC
pkgver=2.0
pkgrel=3
pkgdesc="A dark Cinnamon theme with an airy panel and metallic buttons and switches."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/86"
license=('unknown')
depends=('cinnamon' 'ttf-droid')
source=(http://cinnamon-spices.linuxmint.com/uploads/themes/$_file.zip)
sha1sums=('78a135e4a6e507c482335c22c5668c0e835795cb')

package() {
  cd "$srcdir/odinthemes"
  find Odin* -type f -exec install -Dm644 {} "$pkgdir/usr/share/themes/{}" \; 
}

# vim:set ts=2 sw=2 et:

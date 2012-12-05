# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=cinnamon-theme-cinnamint
pkgver=1.6
pkgrel=1
pkgdesc="Cinnamint theme for Cinnamon."
arch=('any')
url="http://cinnamon-spices.linuxmint.com/themes/view/120"
license=('unknown')
depends=('cinnamon' 'ttf-roboto')
source=(http://cinnamon-spices.linuxmint.com/uploads/themes/H7CS-S75X-067I.zip)
sha1sums=('a20e94fcc92870db72e1d504332aae91d12fc1c2')

package() {
  find "Cinnamint_1.6" -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:


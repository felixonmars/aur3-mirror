# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=vb-fix
pkgver=1
pkgrel=1
pkgdesc='Fix for mono-basic'
depends=('mono-basic<=2.10-4')
arch=('any')
license=('none')
url="about:blank"

package() {
  install -d "$pkgdir"/usr/lib/mono/4.5
  ln -s /usr/lib/mono/4.0/Microsoft.VisualBasic.dll "$pkgdir/usr/lib/mono/4.5/Microsoft.VisualBasic.dll"
}

# vim:set ts=2 sw=2 et:

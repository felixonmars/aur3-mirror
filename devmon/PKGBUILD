# Maintainer: Steven Allen <steven@stebalien.com>
# Contributor: IgnorantGuru <ignorantguru@gmx.com>

pkgname=devmon
pkgver=1.1.7
pkgrel=1
pkgdesc="An automounter for removable drives"
url="https://igurublog.wordpress.com/downloads/script-$pkgname/"
arch=(any)
license=('GPL3')
depends=('udisks<1.9' 'bash>=4')
optdepends=('consolekit: for udisks polkit permissions'
            'spacefm: for pop-up dialogs'
            'zenity: an alternative pop-up dialog provider'
            )
conflicts=('devmon-git' 'udevil')
source=("https://raw.github.com/IgnorantGuru/udevil/8f1122f4361028d8044c65de359ad95eaed2e105/src/devmon")
sha256sums=('13bfdb215a2bc9857bb05ae2063a78b2d69e43ac03c55e6f52eb3ad11d6d887b')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

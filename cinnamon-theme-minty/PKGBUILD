# Contributor: gareth_c
# Maintainer: Ner0

pkgname=cinnamon-theme-minty
pkgver=2.2
pkgrel=1
pkgdesc="Cinnamon theme with some flavour of Linux Mint"
url="http://cinnamon-spices.linuxmint.com/themes/view/25"
license=('GPL')
arch=('any')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/themes/3BIV-8Z06-MCQQ.zip")
md5sums=('3e394335a4cc4f5c6f6392806b26efc0')

package() {
  find Minty/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

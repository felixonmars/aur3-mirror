# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: slubman <slubman.dndd@laposte.net>

pkgname=imageshack-upload
pkgver=0.4
pkgrel=3
pkgdesc="Bash script for uploading images to imageshack.us"
arch=('any')
url="https://github.com/cota/imageshack-upload"
license=('GPL')
depends=('curl')
source=(
  "${pkgname}-${pkgver}.zip"::'https://github.com/cota/imageshack-upload/zipball/v0.4'
)
sha256sums=(
  'd5942aa57ac7530b1fc5bffd96200e5866f999f6aa8edd58f9213519cb4068b7'
)

package() {
  cd "${srcdir}/cota-${pkgname}-9ee901f"
  install -Dm755 'imageshack-upload' "${pkgdir}/usr/bin/imageshack-upload"
}

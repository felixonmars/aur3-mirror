# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=coinpunk
pkgver=20150317
pkgrel=1
pkgdesc="Free Software, Self-Hosted DIY Bitcoin Wallet Service"
url="https://github.com/kyledrake/coinpunk"
arch=('any')
license=('BSD 2-Clause')
depends=('nodejs' 'redis' 'ntp')
makedepends=('git' 'ntp' 'nodejs')
source=("git://github.com/kyledrake/coinpunk.git")
sha256sums=(SKIP)

package() {
  cd "${srcdir}/${pkgname}"
  npm install -g --prefix "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${pkgdir}"
  mv lib usr/
}

pkgver() {
  date +%Y%m%d
}


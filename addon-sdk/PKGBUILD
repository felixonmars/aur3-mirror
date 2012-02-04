# Contributor: Johannes Dewender  < arch at JonnyJD dot net >

pkgname=addon-sdk
pkgver=1.4
pkgrel=1
pkgdesc="SDK to build addons for Mozilla products (formerly jetpack)"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/latest/"
arch=('any')
license=('BSD' 'MIT' 'GPL2' 'CCPL:by' 'CCPL:by-sa')
depends=('python2')
optdepends=('firefox' 'firefox-nightly')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='addon-sdk.install'
md5sums=('2c61800f72fdc39a9eaf10518fe36802')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

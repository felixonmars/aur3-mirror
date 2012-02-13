# Contributor: Johannes Dewender  < arch at JonnyJD dot net >

pkgname=addon-sdk
pkgver=1.4.3
pkgrel=1
pkgdesc="SDK to build add-ons for Mozilla products (formerly jetpack)"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/latest/"
arch=('any')
# 1.4:
license=('MPL' 'GPL2' 'LGPL2.1' 'BSD' 'MIT' 'CCPL:by' 'CCPL:by-sa')
# 1.5 will be:
#license=('MPL' 'CCPL:by' 'CCPL:by-sa')
depends=('python2')
optdepends=('firefox' 'firefox-nightly')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='addon-sdk.install'
md5sums=('ed49ee1878bae6b459c13e80b4eed1d3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

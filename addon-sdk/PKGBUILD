# Contributor: Johannes Dewender  < arch at JonnyJD dot net >
# Contributor: trashstar

pkgname=addon-sdk
pkgver=1.8.2
pkgrel=1
pkgdesc="SDK to build add-ons for Mozilla products (formerly jetpack)"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/latest/"
arch=('any')
license=('MPL2')
depends=('python2')
optdepends=('firefox' 'firefox-nightly')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='addon-sdk.install'

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:
md5sums=('3e780b75a61ceee23c8da28c3e42c3bc')

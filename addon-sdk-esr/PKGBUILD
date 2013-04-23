# Contributor: Johannes Dewender  < arch at JonnyJD dot net >

pkgname=addon-sdk-esr
_pkgname=addon-sdk
pkgver=1.12
pkgrel=1
pkgdesc="addon-sdk/jetpack for the Extended Support Release of Firefox"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/1.12/"
arch=('any')
license=('MPL2')
depends=('python2')
optdepends=('firefox-esr-bin')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='addon-sdk.install'
md5sums=('d767916cd89021880c2241d0f3c1d204')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

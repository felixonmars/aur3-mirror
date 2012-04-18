# Contributor: Johannes Dewender  < arch at JonnyJD dot net >

pkgname=addon-sdk-esr
_pkgname=addon-sdk
pkgver=1.5
pkgrel=2
pkgdesc="addon-sdk/jetpack for the Extended Support Release of Firefox"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/1.5/"
arch=('any')
license=('MPL2')
depends=('python2')
optdepends=('firefox-esr')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='addon-sdk.install'
md5sums=('8b73ef94708c5a3729636e662b6e0fd0')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

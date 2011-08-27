# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=addon-sdk
pkgver=1.0
pkgrel=1
pkgdesc="Mozilla Add-on SDK to build addons in Mozilla products (formerly jetpack)"
url="https://addons.mozilla.org/en-US/developers/docs/sdk/1.0/"
arch=('x86_64' 'i686')
license=('MPLv1.1')
depends=('python2')
optdepends=('firefox' 'firefox-nighlty')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://ftp.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-${pkgver}.tar.gz")
install='install'
md5sums=('167180ba9203e45698d561df0f00c206')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  grep -Rl python . | xargs sed -ri 's/([^!]|^)python(\s|$)/\1python2\2/g'
}

package() {
  mkdir "${pkgdir}/opt"
  mv "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}

# vim:set ts=2 sw=2 et:

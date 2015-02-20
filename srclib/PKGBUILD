# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=srclib
pkgver=0.0.35
pkgrel=1
pkgdesc='Hackable, multi-language code analysis library for building better code tools.'
url='http://srclib.org'
arch=('any')
license=('MIT')
depends=()
makedepends=('go' 'godep')
conflicts=('src')
provides=('src')
source=("${pkgname}-${pkgver}.zip"::'https://api.equinox.io/1/Applications/ap_BQxVz1iWMxmjQnbVGd85V58qz6/Updates/Asset/src.zip?os=linux&arch=amd64&channel=stable')
md5sums=('ac87e296777295ceb1c3947740574117')

build() {
  cd "${srcdir}"
  PATH="$PATH:${srcdir}" src toolchain install-std
}

package() {
  cd "${srcdir}"
  mkdir -p $pkgdir/usr/bin
  mv src $pkgdir/usr/bin
}
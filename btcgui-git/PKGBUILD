# Maintainer: Mikhail Ivchenko <ematirov at gmail dot com>

pkgname=btcgui-git
pkgver=0.2.2.ALPHA.r9.g81a722b
pkgrel=1
pkgdesc="A graphical client for btcwallet and btcd written using gotk3."
arch=('x86_64' 'i686')
url="https://github.com/conformal/btcwallet"
license=('custom:ISC')
depends=('gtk3')
makedepends=('go' 'git' 'mercurial')
install=btcgui.install
source=('btcgui-git::git+https://github.com/conformal/btcgui.git'
		'LICENSE'
		'btcgui.desktop')
sha256sums=('SKIP'
            '5973145b3d76b019f7f3f04adda1b17331ae6ca0120bb630f361d5dec4e751a0'
            '9e03ec08cd9b6f0aa7213a1c409ce06b77bb7ce5a91cb5f69fea773cbffaf848')
_name=btcgui
_source=src/github.com/conformal

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long | sed -r 's/^BTCGUI_//;s/[_]/./g;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"
  mkdir -p "${srcdir}/${_source}"
  if [ -d "${srcdir}/${_source}/${_name}" ]; then
    rm -rf "${srcdir}/${_source}/${_name}"
  fi
  cp -R "${srcdir}/$pkgname" "$srcdir/${_source}/${_name}"
  GOPATH="${srcdir}" go get -v -d
}

build() {
  cd "${srcdir}/${_source}/${_name}"
  GOPATH="$srcdir" go build -x
}

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 btcgui.desktop "${pkgdir}/usr/share/applications/btcgui.desktop"
  cd "${_source}/${_name}"
  install -Dm755 "./${_name}" "${pkgdir}/usr/bin/${_name}"
}

# vim:set ts=2 sw=2 et:

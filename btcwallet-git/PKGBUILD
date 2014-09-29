# Maintainer: Mikhail Ivchenko <ematirov at gmail dot com>

pkgname=btcwallet-git
pkgver=0.4.0.ALPHA.r103.g4a2c4a3
pkgrel=1
pkgdesc="A daemon handling bitcoin wallet functionality for a single user."
arch=('x86_64' 'i686')
url="https://github.com/conformal/btcwallet"
license=('custom:ISC')
depends=('glibc')
makedepends=('go' 'git' 'mercurial')
install=btcwallet.install
source=('btcwallet-git::git+https://github.com/conformal/btcwallet.git'
		'LICENSE')
sha256sums=('SKIP'
            '5973145b3d76b019f7f3f04adda1b17331ae6ca0120bb630f361d5dec4e751a0')
_name=btcwallet
_source=src/github.com/conformal

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long | sed -r 's/^BTCWALLET_//;s/[_]/./g;s/([^-]*-g)/r\1/;s/-/./g'
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
  cd "${_source}/${_name}"
  install -Dm755 "./${_name}" "${pkgdir}/usr/bin/${_name}"
}

# vim:set ts=2 sw=2 et:

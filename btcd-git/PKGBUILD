# Maintainer: Mikhail Ivchenko <ematirov at gmail dot com>

pkgname=btcd-git
pkgver=0.9.0.BETA.r0.g0264740
pkgrel=1
pkgdesc="An alternative full node bitcoin implementation written in Go (golang)"
arch=('x86_64' 'i686')
url="https://github.com/conformal/btcd"
license=('custom:ISC')
depends=('glibc')
makedepends=('go' 'git' 'mercurial')
install=btcd.install
source=('btcd-git::git+https://github.com/conformal/btcd.git')
sha256sums=('SKIP')
_name=btcd
_source=src/github.com/conformal

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long | sed -r 's/^BTCD_//;s/[_]/./g;s/([^-]*-g)/r\1/;s/-/./g'
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
  cd "${srcdir}/${pkgname}/util/"
  for _util in `ls`; do
    cd "${_util}"
    GOPATH="$srcdir" go build -x
    cd ../
  done
}

package() {
  cd "${srcdir}/${_source}/${_name}"
  install -Dm755 "./${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${srcdir}/${pkgname}/util/"
  for _util in `ls`; do
    install -Dm755 "${_util}/${_util}" "${pkgdir}/usr/bin/${_util}"
  done
}

# vim:set ts=2 sw=2 et:

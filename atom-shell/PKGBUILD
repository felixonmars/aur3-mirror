# Maintainer: Daniel Perez <tuvistavie@gmail.com>

pkgname=atom-shell
pkgver=0.13.0
pkgrel=0
pkgdesc="Framework to write cross-platform desktop applications using JavaScript, HTML and CSS."
arch=('x86_64')
url="https://github.com/atom/atom-shell"
license=('MIT')
depends=()
makedepends=()
optdepends=()
options=()
source=("${pkgname}.zip::https://github.com/atom/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-linux-x64.zip")
md5sums=('52227cdcbd2dc815b80dcce282080b80')

package() {
  rm "${srcdir}/${pkgname}.zip"

  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/." "${pkgdir}/opt/${pkgname}"

  if [[ ! -f "${pkgdir}/opt/${pkgname}/libudev.so.0" ]]; then
    ln -s "/usr/lib/libudev.so.1" "${pkgdir}/opt/${pkgname}/libudev.so.0"
  fi

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/atom" "${pkgdir}/usr/bin/atom-shell"
}

# Maintainer: foalsrock <foalsrock at gmail dot-com>

pkgname=goreplace
pkgver=2.3
pkgrel=1
pkgdesc="CLI tool to search and/or replace text in files"
arch=('i686' 'x86_64')
url="https://github.com/piranha/goreplace"
license=('custom')

if [[ ${CARCH} == 'i686' ]]; then
  source=("gr::${url}/releases/download/${pkgver}/gr-32-linux")
  md5sums=('493155f5fae3e8ec79b1c31543550156')
elif [[ ${CARCH} == 'x86_64' ]]; then
  source=("gr::${url}/releases/download/${pkgver}/gr-64-linux")
  md5sums=('60c45152d0d148a61d10b6405b879a6e')
fi

package() {
  install -Dm755 "${srcdir}/gr" "${pkgdir}/usr/bin/gor"
}

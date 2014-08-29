# Maintainer: korjjj <korjjj+aur@gmail.com>

pkgname=etcdctl
pkgver=0.4.6
pkgrel=1
pkgdesc='A simple command line client for etcd.'
arch=('x86_64' 'i686')
url='https://github.com/coreos/etcdctl'
license=('Apache License 2')
makedepends=('go')

source=("https://github.com/coreos/${pkgname}/archive/v${pkgver}.tar.gz")

md5sums=('5158e92753caa884a8d38151e340a973')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

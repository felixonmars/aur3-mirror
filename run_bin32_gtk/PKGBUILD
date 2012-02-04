# Contributor: dejavu <pauli8585@hotmail.com>
# Credits: buttons and alexwizard

pkgname=run_bin32_gtk
pkgver=0.1
pkgrel=1
pkgdesc="A small wrapper script for setting the lib32-gtk environment."
url="http://www.archlinux.org"
arch=('x86_64')
license=('GPL')
provides=(${pkgname})
source=("${pkgname}")
md5sums=('64de6a5d4f15a9d6d21d0ea9832578b3')

build() {
  cd ${srcdir}
  install -Dm755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

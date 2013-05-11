# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=pylan
pkgver=1.0
pkgrel=2
pkgdesc="PyGTK based tool for JMeter XML and CSV logs analysis."
arch=(any)
url="http://code.google.com/p/pylan"
license=(BSD)
depends=(python2-numpy python2-matplotlib python-lxml)
changelog=Changelog
source=("${pkgname}.py::http://pylan.googlecode.com/files/Pylan_${pkgver}.py")
md5sums=('df0fa4efe09b6d40ceb788f1ebb99b6b')

build() {
  msg2 "Add shebang..."
  sed -i '1i#!/usr/bin/env python2' "${srcdir}/${pkgname}.py"
}

package() {
  msg2 "Install script to /usr/bin"
  install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}

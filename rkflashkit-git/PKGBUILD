# Maintainer: Muflone <webreg(at)vbsimple.net>

pkgname=rkflashkit-git
pkgver=10.caa7df5
pkgrel=1
pkgdesc="A toolkit for flashing Linux kernel images to rk3066/rk3188 based devices"
url="https://github.com/linuxerwang/rkflashkit"
arch=(any)
license=('GPL2')
depends=('python2' 'pygtk')
makedepends=('git' 'waf')
source=("${pkgname}"::"git://github.com/linuxerwang/${pkgname%%-*}.git")
sha256sums=('SKIP')
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${pkgname}"
  # Fix python with python2
  sed -i 's_#! /usr/bin/env python_#!/usr/bin/env python2_' "src/${pkgname%-*}/main.py"
  sed -i 's_#! /usr/bin/python_#!/usr/bin/env python2_' "debian/usr/bin/${pkgname%-*}"
}

build() {
  cd "${pkgname}"
  PYTHON=python2 waf configure build install
}

package() {
  cd "${pkgname}"
  cp -R debian/usr "${pkgdir}"
}


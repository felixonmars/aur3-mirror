# Maintainer: Oliver Mangold <o.mangold at gmail dot com>
pkgname=python-contextlib2
pkgver=0.4.0
pkgrel=1
pkgdesc="backport of contextlib from python3"
url="http://contextlib2.readthedocs.org/"
license=('PSF')
arch=('any')
makedepends=('python-pip' 'python-distribute')

provides=("${pkgname}")

build() {
  cd "${srcdir}"
  pip install --root "${pkgdir}" --src "${srcdir}/src" --no-deps -I "contextlib2"=="${pkgver}"
}

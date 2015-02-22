# $Id$
# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: Mario A. Vazquez <mario_vazq@hotmail.com>

_pkgbase=pyxdg
pkgname='pypy-xdg'
pkgver=0.25
pkgrel=2
pkgdesc="Python library to access freedesktop.org standards"
arch=('any')
url="http://freedesktop.org/Software/pyxdg"
license=("LGPL")
makedepends=('pypy')
source=(http://www.freedesktop.org/~takluyver/${_pkgbase}-${pkgver}.tar.gz)
sha1sums=('1272ee62b8c3909ac4844a34a95f8b1fb3398af2')

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  pypy setup.py install --prefix=/usr --root="${pkgdir}"
}

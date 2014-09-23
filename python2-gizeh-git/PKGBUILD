# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>

_pkgname=gizeh
pkgname=python2-${_pkgname}-git
pkgver=129355
pkgrel=1
pkgdesc="Cairo for tourists -- a Python library for vector graphics written on top of cairocffi"
arch=("any")
url="https://github.com/Zulko/gizeh"
license=("MIT")
makedepends=("git" "python2-setuptools")
depends=("python2-cffi" "python2-cairocffi" "python2-numpy" "python2-decorator")

source=("git+https://github.com/Zulko/gizeh")
sha512sums=("SKIP")

package() {
	 cd "${srcdir}/${_pkgname}"
	 python2 setup.py install --root="${pkgdir}" --optimize=1
}

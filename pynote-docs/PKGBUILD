# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=pynote-docs
_pkgname=pynote
pkgver=0.2.2
pkgrel=1
pkgdesc="Manpages and HTML documentation for pynote"
arch=('any')
url="https://github.com/rumpelsepp/pynote"
license=('MIT')
depends=()
makedepends=('git' 'python-sphinx')
conflicts=('pynote-docs-git')
provides=('pynote-docs')
source=("${_pkgname}::git+https://github.com/rumpelsepp/${_pkgname}.git")
md5sums=('SKIP')


prepare() {
  cd "${srcdir}/${_pkgname}"/doc
  make man
  make html
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p ${pkgdir}/usr/share/man/man5/
  mkdir -p ${pkgdir}/usr/share/doc/pynote/
  
  cp -ra doc/man/noterc.5 ${pkgdir}/usr/share/man/man5/noterc.5
  cp -ra doc/html/* ${pkgdir}/usr/share/doc/pynote/
}


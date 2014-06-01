# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=pynote-docs-git
_pkgname=pynote
pkgver=0.2.2.r51.gd048b2b
pkgrel=1
pkgdesc="Manpages and HTML documentation for pynote"
arch=('any')
url="https://github.com/rumpelsepp/pynote"
license=('MIT')
depends=()
makedepends=('git' 'python-sphinx')
conflicts=('pynote-docs')
provides=('pynote-docs')
source=("${_pkgname}::git+https://github.com/rumpelsepp/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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


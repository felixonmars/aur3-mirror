# Maintainer:  Nidhogg

pkgname=ppgen-git
_clname=ppgen
pkgver=20150222
pkgrel=1
pkgdesc="A passphrase generator"
arch=('any')
url="https://gitlab.com/arunisaac/ppgen"
license=('GPL3')
depends=('common-lisp' 'cl-asdf' 'cl-launch' 'cl-unix-options-git')
source=(git+https://gitlab.com/arunisaac/${_clname}.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_clname"
  git log -1 --format=%cd --date=short | sed 's/-//g'
}

package() {
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/bin

  cd "${srcdir}/${_clname}"
  make COMMON_LISP_SOURCE_DIRECTORY=${pkgdir}/usr/share/common-lisp/source \
    ASDF_SOURCE_REGISTRY=${pkgdir}/usr/share/common-lisp/systems \
    BIN_DIRECTORY=${pkgdir}/usr/bin install

  cd "${pkgdir}/usr/share/common-lisp/systems"
  rm ppgen.asd
  ln -s ../source/ppgen/ppgen.asd .
}

# vim:set ts=2 sw=2 et:

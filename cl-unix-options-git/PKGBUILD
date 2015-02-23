# Maintainer:  Nidhogg

pkgname=cl-unix-options-git
_clname=unix-options
pkgver=20150204
pkgrel=1
pkgdesc="A small Common Lisp library for parsing unix-style command line options"
arch=('any')
url="http://www.cliki.net/unix-options"
license=('custom:LLGPL')
depends=('common-lisp' 'cl-asdf')
provides=('cl-unix-options')
source=(git+https://github.com/astine/${_clname}.git LICENSE)
sha256sums=('SKIP'
            '6c717321c333334c0e9f3cc51169d14aa0de52b41730390d8fc3bbfc1fb43259')

pkgver() {
  cd "$srcdir/$_clname"
  git log -1 --format=%cd --date=short | sed 's/-//g'
}

package() {
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
  cd "${srcdir}/${_clname}"
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} *.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} *.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=2 et:

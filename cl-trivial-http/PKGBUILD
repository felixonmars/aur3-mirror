# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-http
_clname=trivial-http
pkgver=20080901
pkgrel=2
pkgdesc="Trivial networking library for Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/trivial-http/"
license=('MIT')   # MIT?

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf' 'cl-usocket')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf' 'cl-usocket')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'cl-usocket')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf' 'cl-usocket')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf' 'cl-usocket')
else
    depends=('sbcl' 'cl-usocket')
fi

install=cl-trivial-http.install
source=('http://common-lisp.net/project/trivial-http/trivial-http.tar.gz')
md5sums=('5b946bf310b2784b5f766c12fbab3dc5')
options=(docs)

build() {
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/dev
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${_clname}

	cd ${srcdir}/${_clname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/dev \
		${srcdir}/${_clname}/dev/*.lisp || return 1
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd || return 1
	install -m 644 -t ${pkgdir}/usr/share/licenses/${_clname} \
		${srcdir}/${_clname}/COPYING || return 1

	cd ${pkgdir}/usr/share/common-lisp/systems 
	ln -s ../source/${_clname}/${_clname}.asd .
#	ln -s ../source/${_clname}/${_clname}-tests.asd .
}

# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-garbage
_clname=trivial-garbage   # used in CL scope, not package scope
pkgver=0.18
pkgrel=1
pkgdesc="provides a portable API to finalizers, weak hash-tables and weak pointers."
arch=('i686' 'x86_64')
url="http://www.cliki.net/trivial-garbage/"
license=('custom') # public domain

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf')
else
    depends=('sbcl')
fi

install=cl-trivial-garbage.install
source=("http://common-lisp.net/~loliveira/tarballs/${_clname}/${_clname}_${pkgver}.tar.gz")
md5sums=('dbacb5d08d0bd931c09bc1424540d4ec')
options=(docs)


build() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/src
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tests
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}_${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}_${pkgver}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}

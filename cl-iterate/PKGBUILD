# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-iterate
_clname=iterate   # used in CL scope, not package scope
pkgver=1.4.3
pkgrel=1
pkgdesc="iterate is an iteration construct for Common Lisp."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/iterate/"
license=('BSD')

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

install=cl-iterate.install
source=("http://common-lisp.net/project/${_clname}/releases/${_clname}-${pkgver}.tar.gz")
md5sums=('f7b554e02c37ec3b786c6ba413b3a2e6')
options=(docs)


build() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
        install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${pkgver}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${pkgver}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .

	# TODO: docs (SPEC/README)
}

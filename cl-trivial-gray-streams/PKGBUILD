# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-trivial-gray-streams
pkgver=20081102
_clname=trivial-gray-streams   # used in CL scope, not package scope
_reldate=2008-11-02
pkgrel=1
pkgdesc="Compatibility layer library for gray streams in Common Lisp"
arch=('i686' 'x86_64')
url="http://www.cliki.net/trivial-gray-streams"
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

install=cl-trivial-gray-streams.install
source=("http://common-lisp.net/project/cl-plus-ssl/download/${_clname}-${_reldate}.tar.gz")
md5sums=('b833a416997315f5632209a4bd825ad8')


build() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${_reldate}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}-${_reldate}/*.asd

	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${_clname}-${_reldate}/COPYING

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}

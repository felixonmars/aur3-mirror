# Maintainer: mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-closer-mop-darcs
_clname=closer-mop   # used in CL scope, not package scope
pkgver=20090809
pkgrel=1
pkgdesc="A compatibility layer for the CLOS MOP that rectifies many of the absent MOP features as detected by MOP Feature Tests."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/closer/"
license=('MIT')
provides=('cl-closer-mop')

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
makedepends=('darcs') 

install=cl-closer-mop.install
source=()
md5sums=()
options=('docs')

_repo=${url}repos/${_clname}

build() {

    cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/test

	install -d ${pkgdir}/usr/share/common-lisp/systems

	cd ${srcdir}
	echo "Getting source from darcs repository at ${_repo}" | fmt
	if [ -d ${_clname} ]; then  # already pulled once, update instead
	  cd ${_clname}
	  darcs pull || return 1
	else
	  darcs get ${_repo} || return 1
          cd ${_clname} || return 1
	fi

	
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/test/ \
	  test/*
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/ \
	  *.lisp

# docs
	install -d ${pkgdir}/usr/share/doc/${_clname}
	install -m 644 -t ${pkgdir}/usr/share/doc/${_clname}/ \
	  *.txt

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	  *.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}

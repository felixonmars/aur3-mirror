# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-metabang-bind-git
_clname=metabang-bind   # used in CL scope, not package scope
pkgver=20100725
pkgrel=1
pkgdesc="Bind extends the idea of of let and destructing to provide a uniform syntax for all your accessor needs."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/metabang-bind/"
license=('MIT') 
provides=('cl-metabang-bind')

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
makedepends=('git') 

install=cl-metabang-bind.install
source=()
md5sums=()
options=('docs')

_gitroot="git://github.com/gwkkwg/metabang-bind"
_gitname="metabang-bind"


build() {

    cat << EOM

	WARNING!

	You are about to build a package using a snapshot from a repository.
        The resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

    for _dir in dev unit-tests; do
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}
    done
	install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	### Git checkout
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
	  cd $_gitname && git pull origin
	  msg "The local files are updated."
	else
	  git clone $_gitroot $_gitname
	fi
	cd "$srcdir/$_gitname"
	
	msg "GIT checkout done or server timeout"

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/ \
		lift-standard.config
    for _dir in dev unit-tests; do
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}/ \
		${_dir}/*
    done
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		*.asd
	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
		${srcdir}/${_clname}/COPYING

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
	ln -s ../source/${_clname}/${_clname}-test.asd .
}

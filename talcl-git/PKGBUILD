# Contributor: James Feng Cao <jamesfengcao@yahoo.com>

pkgname=talcl-git
pkgver=20110619
pkgrel=1
pkgdesc="Common lisp library for tal template language"
arch=('i686' 'x86_64')
url="https://github.com/bobbysmith007/talcl"
license=('LGPL')
provides=('talcl')
conflicts=()

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

source=()
md5sums=()
options=()

_clname=talcl

_gitroot="https://github.com/bobbysmith007/talcl.git"
_gitname="talcl"


build() {

    cat << EOM

	WARNING!

	You are about to build a pre-release package using a snapshot from a
	repository. The resulting package may be unusable or pose a security
	risk, since the install script does not check source file hashes. Do
	not continue if this is undesirable.

EOM

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
	install -d ${pkgdir}/usr/share/common-lisp/systems

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

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/src/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/${_clname}.asd .
}

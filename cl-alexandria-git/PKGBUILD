# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor: veox <box 55 [shift-two] mail [dot] ru>

# 'alexandria' is taken by another app
pkgname=cl-alexandria-git 
pkgver=20121028
pkgrel=1
pkgdesc="Common Lisp portability library"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/alexandria/"
license=('custom') # Public Domain
provides=('cl-alexandria')
conflicts=('cl-alexandria-darcs')

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

#makedepends=('darcs') # 'texi2html')

install=cl-alexandria.install
source=()
md5sums=()
options=(docs)

_clname=alexandria

_gitroot="git://common-lisp.net/projects/alexandria/alexandria.git"
_gitname="alexandria"


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
	install -d ${pkgdir}/usr/share/licenses/${_clname}

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
		${srcdir}/${_clname}/*.lisp
	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
		${srcdir}/${_clname}/*.asd
	install -m 644 -t ${pkgdir}/usr/share/licenses/${_clname} \
		${srcdir}/${_clname}/LICENCE

	cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${_clname}/alexandria.asd .
	ln -s ../source/${_clname}/alexandria-tests.asd .
}

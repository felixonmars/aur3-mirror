# Maintainer:   mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-opengl-git
_clname=cl-opengl   # used in CL scope, not package scope
pkgver=20101216
pkgrel=1
pkgdesc="A set of CFFI bindings for Common Lisp to the OpenGL, GLU and GLUT APIs"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-opengl/"
license=('BSD')
provides=('cl-opengl')
conflicts=('cl-opengl-darcs')
replaces=('cl-opengl-darcs')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
else
    depends=('sbcl' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-trivial-features')
fi
makedepends=('git') 

install=cl-opengl.install
source=()
md5sums=()
options=(docs)


_gitroot="git://github.com/3b/cl-opengl.git"
_gitname="cl-opengl"

build() {

    cat << EOM

	WARNING!

	You are building a package using a snapshot from a repository. The
        resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/examples
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/gl
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/glu
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/glut
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/spec
	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/tools
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

#	cd ${srcdir}/${_clname}
	cp -r examples ${pkgdir}/usr/share/common-lisp/source/${_clname}/
	for _dir in gl glu glut spec tools; do
	  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir} \
	    ${_dir}/* || return 1
	done

	install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
	    *.asd || return 1
	install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} \
	    COPYING || return 1

	cd ${pkgdir}/usr/share/common-lisp/systems
	for _asd in cl-glu cl-glu-examples cl-glut cl-opengl; do
	  ln -s ../source/${_clname}/${_asd}.asd .
	done

}

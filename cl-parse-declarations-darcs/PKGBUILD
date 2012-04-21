#Contributor : Akshay Srinivasan <akshaysrinivasan at gmail.com>
# darcs get http://common-lisp.net/project/parse-declarations/darcs/parse-declarations

pkgname=cl-parse-declarations-darcs
_clname=parse-declarations   # used in CL scope, not package scope
_asdname=parse-declarations-1.0

pkgver=20120421
pkgrel=1
pkgdesc="Common Foreign Function Interface for Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/parse-declarations/"
license=('BSD')

depends=('common-lisp')

makedepends=('darcs')

install=${_clname}.install
md5sums=('396f62947420172cc89406d7a7b6da79')

_darcsroot="http://common-lisp.net/project/parse-declarations/darcs/parse-declarations"
_darcsname="parse-declarations"

build() {
    
    cat << EOM

	WARNING!

	You are building a package using a snapshot from a repository. The
        resulting package may be unusable or pose a security risk, since
        the install script does not check source file hashes. Do not continue
        if this is undesirable.

EOM


    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/
    install -d ${pkgdir}/usr/share/common-lisp/systems

    ### Darcs pull
    cd "$srcdir"
    msg "Connecting to DARCS server...."
    
    if [ -d $_darcsname ] ; then
	cd $_darcsname && darcs pull
	msg "The local files are updated."
    else
	darcs get ${_darcsroot}
    fi

    cd ${srcdir}/${_darcsname}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/ \
        ${srcdir}/${_darcsname}/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/ \
        ${srcdir}/${_darcsname}/*.asd
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/ \
        ${srcdir}/${_darcsname}/LICENSE   
    
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_asdname}.asd .
}

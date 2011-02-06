# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
pkgname=clx
pkgver=0.7.4
pkgrel=1
pkgdesc="Xlib for common lisp systems"
arch=('i686' 'x86_64')
url="http://www.cliki.net/CLX"
license=('custom')
depends=('x-server' 'sbcl')
makedepends=('texinfo')
install=clx.install
source=(http://common-lisp.net/~abridgewater/dist/clx/${pkgname}-${pkgver}.tgz
        README.licensing)
md5sums=('d18b9fcc3a5d085e1a73c59a6ecc9413'
         '74858379015567928f1eee186d9db1a4')


build() {
    
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/common-lisp/source/${pkgname}/{debug,demo,test}
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -d ${pkgdir}/usr/share/info
	cd ${pkgdir}/usr/share/common-lisp/source/${pkgname}

    install -m 644 -t . ${srcdir}/${pkgname}-${pkgver}/*.lisp
    install -m 644 -t debug ${srcdir}/${pkgname}-${pkgver}/debug/*.lisp
    install -m 644 -t demo ${srcdir}/${pkgname}-${pkgver}/demo/*.lisp
    install -m 644 -t test ${srcdir}/${pkgname}-${pkgver}/test/*.lisp

    install -m 644 -t . ${srcdir}/${pkgname}-${pkgver}/${pkgname}.asd
    cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${pkgname}/${pkgname}.asd .

    cd ${srcdir}/${pkgname}-${pkgver}/manual
    makeinfo ${pkgname}.texinfo
    install -m 644 ${pkgname}.info ${pkgdir}/usr/share/info

    install -m 644 ${srcdir}/README.licensing ${pkgdir}/usr/share/licenses/${pkgname}

    msg "---> Compiling lisp files <---"

    sbcl --no-sysinit --no-userinit \
         --eval '(require :asdf)' \
         --eval "(pushnew #p\"${pkgdir}/usr/share/common-lisp/systems/\" asdf:*central-registry* :test #'equal)" \
         --eval "(asdf:operate 'asdf:compile-op 'clx)" \
         --eval '(quit)' || return 1

    echo "---> Done compiling lisp files <---"


}

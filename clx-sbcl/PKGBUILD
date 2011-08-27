# Contributor: Alexander Vynnyk <cosmonaut (dot) ok (at) gmail (dot) com>
pkgname=clx-sbcl
pkgorigname=clx
pkgver=0.7.4
pkgrel=2
pkgdesc="Xlib for common lisp systems. SBCL build"
arch=('i686' 'x86_64')
url="http://www.cliki.net/CLX"
license=('custom')
depends=('xorg-server' 'sbcl')
makedepends=('texinfo')
install=clx.install
source=(http://common-lisp.net/~abridgewater/dist/clx/${pkgorigname}-${pkgver}.tgz
        README.licensing)
md5sums=('d18b9fcc3a5d085e1a73c59a6ecc9413'
         '74858379015567928f1eee186d9db1a4')


build() {
    
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/common-lisp/source/${pkgorigname}/{debug,demo,test}
    install -d ${pkgdir}/usr/share/licenses/${pkgorigname}
    install -d ${pkgdir}/usr/share/info
	cd ${pkgdir}/usr/share/common-lisp/source/${pkgorigname}

    install -m 644 -t . ${srcdir}/${pkgorigname}-${pkgver}/*.lisp
    install -m 644 -t debug ${srcdir}/${pkgorigname}-${pkgver}/debug/*.lisp
    install -m 644 -t demo ${srcdir}/${pkgorigname}-${pkgver}/demo/*.lisp
    install -m 644 -t test ${srcdir}/${pkgorigname}-${pkgver}/test/*.lisp

    install -m 644 -t . ${srcdir}/${pkgorigname}-${pkgver}/${pkgorigname}.asd
    cd ${pkgdir}/usr/share/common-lisp/systems
	ln -s ../source/${pkgorigname}/${pkgorigname}.asd .

    cd ${srcdir}/${pkgorigname}-${pkgver}/manual
    makeinfo ${pkgorigname}.texinfo
    install -m 644 ${pkgorigname}.info ${pkgdir}/usr/share/info

    install -m 644 ${srcdir}/README.licensing ${pkgdir}/usr/share/licenses/${pkgorigname}

    msg "---> Compiling lisp files <---"

    sbcl --no-sysinit --no-userinit \
         --eval '(require :asdf)' \
         --eval "(pushnew #p\"${pkgdir}/usr/share/common-lisp/systems/\" asdf:*central-registry* :test #'equal)" \
         --eval "(asdf:operate 'asdf:compile-op 'clx)" \
         --eval '(quit)' || return 1

    echo "---> Done compiling lisp files <---"


}

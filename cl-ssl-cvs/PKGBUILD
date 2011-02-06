# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-ssl-cvs
_clname=cl+ssl  # same as _cvsmod used later on
pkgver=20090814
pkgrel=2
pkgdesc="A Common Lisp interface to OpenSSL"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-plus-ssl/"
license=('BSD')
provides=('cl-ssl')
# TODO: add 'cl-asdf' when sbcl has it
depends=('common-lisp' 'cl-alexandria' 'cl-babel' 'cl-cffi' 'cl-flexi-streams' 'cl-trivial-features' 'cl-trivial-gray-streams')
install=cl-ssl.install
source=()
md5sums=()

_cvsroot=":pserver:anonymous:anonymous@common-lisp.net:/project/cl-plus-ssl/cvsroot"
_cvsmod="cl+ssl"

build() {
  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/share/licenses/${pkgname}

  # get/update sources
  cd $srcdir
  if [ -d ${_cvsmod}/CVS ]; then
    cd ${_cvsmod}
    cvs update -dA
  else
    cvs -z3 -d ${_cvsroot} co ${_cvsmod}
    cd ${_cvsmod}
  fi

  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.lisp || return 1
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd || return 1
  install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname} || return 1

  cd ${pkgdir}/usr/share/common-lisp/systems
  ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:

# Maintainer:  mrshpot <mrshpot at gmail dot com>

pkgname=cl-local-time
_clname=local-time   # used in CL scope, not package scope
pkgver=1.0.3
pkgrel=1
pkgdesc="A development library for manipulating date and time information in a semi-standard manner."
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/local-time/"
license=('BSD')

depends=('common-lisp' 'cl-asdf' 'cl-fad')
optdepends=('cl-fiveam: for tests')
makedepends=('texinfo')
options=('docs')

install=cl-local-time.install
source=("http://common-lisp.net/project/${_clname}/${_clname}-${pkgver}.tar.gz")
md5sums=('ea40227c5b88c5a0f370d3d470ebc682')

build() {

  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
  install -d ${pkgdir}/usr/share/common-lisp/systems
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}

  cd "$srcdir/$_clname"
  
  install -m 644 -t ${pkgdir}/usr/share/licenses/${pkgname} COPYING
  cp -r src test zoneinfo \
	${pkgdir}/usr/share/common-lisp/source/${_clname}/
  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname} \
    *.asd

  cd ${pkgdir}/usr/share/common-lisp/systems
  for _asd in ../source/${_clname}/*.asd ; do ln -s "$_asd" ./ ; done

  cd "$srcdir/$_clname/doc/"
  make
  install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \
	manual/index.html
  install -d ${pkgdir}/usr/share/doc/${pkgname}/html_node
  install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname}/html_node \
	manual/html_node/*.html
}

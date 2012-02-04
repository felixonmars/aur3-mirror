# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-lispbuilder-sdl
_clname=lispbuilder-sdl
pkgver=0.9.8.1
pkgrel=3
pkgdesc="SDL game and multimedia library for Common Lisp"
arch=('i686' 'x86_64')
url="http://code.google.com/p/lispbuilder/"
license=('MIT')

depends=('common-lisp' 'cl-asdf' 'sdl' 'cl-trivial-garbage')
optdepends=('cl-vectors: vector graphics'
  'cl-zpb-ttf: required for cl-vectors support'
  'cl-vecto: vector graphics')

install=cl-lispbuilder-sdl.install
source=('http://lispbuilder.googlecode.com/files/lispbuilder-sdl-0.9.8.1.tgz')
md5sums=('32380fbc7622ada4082d25baa5c95fe2')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems

    cd ${srcdir}/${_clname}
	rm -rf trivial-garbage.asd trivial-garbage/
	
	make || exit 1

	cp -r * ${pkgdir}/usr/share/common-lisp/source/${_clname}
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type f -print0 | xargs -0 chmod 644 || return 1
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type d -print0 | xargs -0 chmod 755 || return 1
	chmod +x ${pkgdir}/usr/share/common-lisp/source/${_clname}/bin/lib${_clname}-glue.so
	ln -s ${pkgdir}/usr/share/common-lisp/source/${_clname}/bin/lib${_clname}-glue.so ${pkgdir}/usr/share/common-lisp/source/${_clname}/bin/${_clname}-glue.so
	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
    ln -s ../source/${_clname}/${_clname}-examples.asd .
    ln -s ../source/${_clname}/${_clname}-cl-vectors.asd .
    ln -s ../source/${_clname}/${_clname}-cl-vectors-examples.asd .
	ln -s ../source/${_clname}/${_clname}-vecto.asd .
    ln -s ../source/${_clname}/${_clname}-vecto-examples.asd .
}

# vim:set ts=2 sw=4 et nospell:

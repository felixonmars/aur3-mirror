# Maintainer:  Taras Shpot <mrshpot at gmail dot com>

pkgname=cl-vectors
_clname=cl-vectors
pkgver=0.1.4b
pkgrel=1
pkgdesc="a pure Common Lisp library to create, transform and render anti-aliased vectorial paths"
arch=('i686' 'x86_64')
url="http://projects.tuxee.net/cl-vectors/"
license=('LGPL')

depends=('common-lisp' 'cl-asdf')

install=cl-vectors.install
source=('http://projects.tuxee.net/cl-vectors/files/cl-vectors-0.1.4b.tar.gz')
md5sums=('a889287626724de563d6b529d19e421b')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
	
    cd ${srcdir}/${_clname}-${pkgver}

	cp -r * ${pkgdir}/usr/share/common-lisp/source/${_clname}
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type f -print0 | xargs -0 chmod 644 || return 1
	find ${pkgdir}/usr/share/common-lisp/source/${_clname} -type d -print0 | xargs -0 chmod 755 || return 1
	
    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:

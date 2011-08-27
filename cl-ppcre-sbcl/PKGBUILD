# Maintainer: mrshpot <mrshpot at gmail dot com>
# Contributor: veox <cy at wre dot ath dot cx>
# Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
# Contributor: Jonathan Friedman <jonf@gojon.com>
pkgname=cl-ppcre-sbcl
pkgorigname=cl-ppcre
pkgver=2.0.3
pkgrel=3
pkgdesc="Perl-compatible, portable regexp library for Common Lisp. SBCL build"
arch=('i686' 'x86_64')
url="http://www.weitz.de/cl-ppcre/"
license=('BSD')

depends=('sbcl')

install=cl-ppcre.install
source=('http://weitz.de/files/cl-ppcre.tar.gz' 'LICENSE')
md5sums=('bd5648fd3c8b6f89eea43f5b82b99aa1'
         'c6aa01dce26b45aa916329701a448d11')

build() {
    install -d ${pkgdir}/usr/share/common-lisp/source/${pkgorigname}
    install -d ${pkgdir}/usr/share/common-lisp/systems
    install -d ${pkgdir}/usr/share/licenses/${pkgorigname}

    cd ${srcdir}/${pkgorigname}-${pkgver}

    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgorigname} \
        ${srcdir}/${pkgorigname}-${pkgver}/*.lisp
    install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${pkgorigname} \
        ${srcdir}/${pkgorigname}-${pkgver}/*.asd
    install -m 644 ${srcdir}/LICENSE \
        ${pkgdir}/usr/share/licenses/${pkgorigname}

    cd ${pkgdir}/usr/share/common-lisp/systems
    ln -s ../source/${pkgorigname}/${pkgorigname}.asd .
    ln -s ../source/${pkgorigname}/${pkgorigname}-unicode.asd .
}

# vim:set ts=2 sw=4 et nospell:

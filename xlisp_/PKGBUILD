# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Contributor:  perlawk
# Maintainer: Alexej Magura <agm2819*gmail*>
pkgname=xlisp_
_pkgname=`echo -n ${pkgname} | sed 's/_//g'`
pkgver=3.0
pkgrel=3
pkgdesc="XLISP: a superset of Scheme extended to support Object Oriented Programming--working."
url="http://www.xlisp.org"
arch=('x86_64' 'i686')
license=('BSD')
depends=()
makedepends=()
conflicts=('xlisp')
replaces=()
source=("http://www.xlisp.org/xlisp.tar.gz")
md5sums=('d11da6aeb612eb5666123a5203c4c059')

build() {
    cd "${srcdir}/${_pkgname}/"
    cp "makefile.unix" "makefile"
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgname}/"
    mkdir -p "${pkgdir}/usr/lib/${_pkgname}-${pkgver}/lib"
#    mkdir -p "${pkgdir}/usr/lib/${_pkgname}-${pkgver}/obj"
    make prefix="${pkgdir}/usr"
#    cd ..
#    cp "${srcdir}/${_pkgname}/makefile.unix" makefile
#    patch "${srcdir}/${_pkgname}/makefile" < patch
#    make 

#  cd $startdir/src/${pkgname}
#  cp $startdir/patch .
#	cp makefile.unix makefile
#	patch makefile < patch
#  make || return 1
#
#	mkdir -p $pkgdir/usr/bin
#	mkdir -p $pkgdir/usr/lib
#	mkdir -p $pkgdir/usr/share/xlisp/doc
#	mkdir -p $pkgdir/usr/share/xlisp/lib
#	install -m755 bin/xlisp* $pkgdir/usr/bin
#	install -m755 lib/lib* $pkgdir/usr/lib
#	install -m755 *lsp $pkgdir/usr/share/xlisp/lib
#	install -m755 *doc $pkgdir/usr/share/xlisp/doc
#

}

package() {
    cd "${srcdir}/${_pkgname}/bin"
    install -m 755 ${_pkgname} "${pkgdir}/usr/bin/"
    cd "${srcdir}/${_pkgname}/lib/"
    install -m 755 libxlisp.a "${pkgdir}/usr/lib/${_pkgname}-${pkgver}/lib/"
    cd "${srcdir}/${_pkgname}/"
    install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/"
#    cd "${srcdir}/${_pkgname}/obj/lib/"
#    ls
}

# Maintainer: DavidK <david_king at softhome dot net>
# Contributor:   mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-md5
_clname=md5
pkgver=2.0.1
pkgrel=1
pkgdesc="MD5 cryptographic protocol implementation by Pierre R. Mai for Common Lisp"
arch=('any')
url="http://www.pmsf.de/resources/lisp/MD5.html"
license=('custom')
depends=('common-lisp')
install=cl-md5.install
source=("http://github.com/pmai/md5/archive/master.zip")
md5sums=('be5431a9002199c2efae01f8fe709e2d')
_zipname=md5-master

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}

    cd "${srcdir}"/$_zipname
	
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} \
        *.asd
    install -m 644 -t "${pkgdir}"/usr/share/licenses/${pkgname} COPYING

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/${_clname}.asd .
}

# vim:set ts=2 sw=4 et nospell:

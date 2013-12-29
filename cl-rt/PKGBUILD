# Maintainer: DavidK <david_king at softhome dot net>

pkgname=cl-rt
pkgver=20040621
pkgrel=1
pkgdesc="Regression Test library for Common Lisp"
arch=('any')
url="http://www.cs.cmu.edu/afs/cs/project/ai-repository/ai/lang/lisp/code/testing/rt"
license=('MIT')
depends=('common-lisp')
install=cl-rt.install
source=('http://files.b9.com/rt/rt.tar.gz')
md5sums=('607e1e44e68bd38749a236182c3c1324')
_clname=rt

package() {
    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -d "${pkgdir}"/usr/share/common-lisp/systems
    install -d "${pkgdir}"/usr/share/licenses/${pkgname}
    cd "${srcdir}"/${_clname}-${pkgver}

    install -d "${pkgdir}"/usr/share/common-lisp/source/${_clname}
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} rt.lisp
    install -m 644 -t "${pkgdir}"/usr/share/common-lisp/source/${_clname} rt.asd
    grep "|" rt-doc.txt > LICENSE
    install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${pkgdir}"/usr/share/common-lisp/systems
    ln -s ../source/${_clname}/rt.asd .

}

# vim:set ts=2 sw=4 et nospell:
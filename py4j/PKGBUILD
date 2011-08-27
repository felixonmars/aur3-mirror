# Maintainer: Yngve Inntjore Levinsen <yngve.inntjore.levinsen@cern.ch>


pkgbase="py4j"
pkgname="py4j"
true && pkgname=('python2-py4j' 'python-py4j')
pkgver=0.7
pkgrel=4
pkgdesc="Enables python programs to dynamically access arbitrary Java objects."
depends=('python' 'java-runtime=7')
makedepends=('python2')
arch=('any')
license=('bsd')
url="http://sourceforge.net/projects/py4j"
md5sums=('6e9577f2c96c4e2e010b708c0c772a80')
source=($pkgbase-$pkgver.tar.gz::"http://pypi.python.org/packages/source/p/py4j/py4j-${pkgver}.tar.gz")
package_python2-py4j() {
    depends=('python2' 'java-runtime=7')
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    pwd
    cd ${pkgbase}-${pkgver}
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
    python2 setup.py install --prefix=${pkgdir}/usr
    cp -r doc ${pkgdir}/usr/share/licenses/${pkgname}/
}
package_python-py4j() {
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    pwd
    cd ${pkgbase}-${pkgver}
    install -D -m644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
    python3 setup.py install --prefix=${pkgdir}/usr
    cp -r doc ${pkgdir}/usr/share/licenses/${pkgname}/
}

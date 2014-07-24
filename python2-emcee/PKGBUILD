pkgname=python2-emcee
pkgver=2.1.0
pkgrel=1
pkgdesc="The Python ensemble sampling toolkit for affine-invariant MCMC"
arch=('any')
url="http://dan.iel.fm/emcee/current/"
license=('MIT')
depends=('python2-numpy')
source=(https://pypi.python.org/packages/source/e/emcee/emcee-2.1.0.tar.gz)
md5sums=('c6b6fad05c824d40671d4a4fc58dfff7')


package () {
    cd $srcdir/emcee-${pkgver}
    for file in $(find . -name '*.py' -print); do
        sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
        sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
    done
    python2 setup.py install --prefix=/usr --root=${pkgdir}

    install -m755 -d "${pkgdir}/usr/share/licenses/python2-emcee"
    install -m644 LICENSE* "${pkgdir}/usr/share/licenses/python2-emcee/"
}

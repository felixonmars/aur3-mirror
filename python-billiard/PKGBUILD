# Maintainer: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=3.3.0.18
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/billiard"
license=(BSD)
depends=(python)
makedepends=(python-setuptools)
source=("https://pypi.python.org/packages/source/b/billiard/billiard-${pkgver}.tar.gz")
md5sums=(96700d11cb4b9d33960eb8e9b55c08c6)

package () {

    cd "${srcdir}/billiard-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -Dm0664 "${srcdir}/billiard-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Remove funtest files (these are required for unit tests and get included from
    # upstream).
    find "${pkgdir}/usr/lib" -name '*funtests*' | xargs rm -rf

}

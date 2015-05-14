# Contributor: nickolsen <sua-aur-661bbb3b [at] brandt-n [dot] eu>
pkgname=python2-openelectrons-i2c
pkgver=1.6
pkgrel=1
pkgdesc="i2c read and writes for products released by openelectrons.com"
arch=(any)
url="https://pypi.python.org/pypi/OpenElectrons_i2c"
license=('unknown')
depends=('python2' 'i2c-tools')
source=('https://pypi.python.org/packages/source/O/OpenElectrons_i2c/OpenElectrons_i2c-1.6.tar.gz')
sha512sums=('19e109ee66d6cf35435a65751c9632ff2e5a48ca8c8443f953cf2484a8c9e527c1d45f8c93b8f3e36c381d792387154df238400544a449c9ed67d63c89ff58c5')

package() {
    cd ${srcdir}/OpenElectrons_i2c-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}


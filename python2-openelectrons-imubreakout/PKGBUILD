# Contributor: Nikolaus Brandt <sua-aur-661bbb3b at brandt-n dot eu>
pkgname=python2-openelectrons-imubreakout
pkgver=1.0
pkgrel=1
pkgdesc="i2c read and write functions for openelectrons.com IMUbreakout board"
arch=(any)
url="https://pypi.python.org/pypi/OpenElectrons_IMUbreakout"
license=('unknown')
depends=('python2' 'i2c-tools' 'python2-openelectrons-i2c')
source=("https://pypi.python.org/packages/source/O/OpenElectrons_IMUbreakout/OpenElectrons_IMUbreakout-1.0.tar.gz")
md5sums=('218ab34aaed57d9cfeeb105bb48f0fb4')

package() {
    cd ${srcdir}/OpenElectrons_IMUbreakout-${pkgver}
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}

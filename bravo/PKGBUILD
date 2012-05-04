# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bravo
pkgver=1.9
pkgrel=1
pkgdesc="A Minecraft server and utilities"
arch=('any')
url="http://www.bravoserver.org/"
license=('MIT')
depends=('python-construct' 'python-nbt' 'python2-numpy' 'twisted')
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/B/Bravo/Bravo-${pkgver}.tar.gz"
        "LICENSE")
md5sums=('6371d40f59a2a2cf43268678889a10fa'
         '0d76ce959115729a71228fc923a3b1a3')

package() {
  cd "${srcdir}/Bravo-${pkgver}"

  sed -i "s_env python_&2_" bravo/*.py
  python2 setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

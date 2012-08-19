# Contributor: bslackr <bslackr@slackwrite.com>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python3-pycrypto
_pkgname=pycrypto
pkgver=2.6
pkgrel=1
pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python."
arch=('i686' 'x86_64')
depends=('python')
url="http://www.dlitz.net/software/pycrypto/"
license=('custom')
source=("http://ftp.dlitz.net/pub/dlitz/crypto/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('88dad0a270d1fe83a39e0467a66a22bb')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp -r LEGAL "${pkgdir}/usr/share/licenses/${pkgname}/"
}

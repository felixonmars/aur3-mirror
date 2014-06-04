# Maintainer: Gilrain <pierre.buard+aur gmail com>
pkgname=python2-stratum
_pkgname=stratum
pkgver=0.2.15
pkgrel=1
pkgdesc="Stratum server implementation based on Twisted."
url="https://pypi.python.org/pypi/stratum/${pkgver}"
arch=('any')
license=('unknown')
depends=('twisted')
optdepends=('python2-ecdsa: for message signatures'
	    'python2-autobahn: for WebSocket transports')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('29d2027bdbbc23fe74235a4f4e7368cd')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py build --build-base="${srcdir}/${_pkgname}-${pkgver}"
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python2 setup.py install --root ${pkgdir}

  # setup /etc/webapps/stratum/ for configuration files
  install -d -m755 ${pkgdir}/etc/webapps/${_pkgname}/
  ln -s /usr/lib/python2.7/site-packages/${_pkgname}/config_default.py ${pkgdir}/etc/webapps/${_pkgname}/config_default.py
  ln -s /etc/webapps/${_pkgname}/config.py ${pkgdir}/usr/lib/python2.7/site-packages/${_pkgname}/config.py

  install -Dm644 README ${pkgdir}/usr/share/doc/${_pkgname}/README
}

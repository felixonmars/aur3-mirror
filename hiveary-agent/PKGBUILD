# Maintainer: Hiveary <info@hiveary.com>

pkgname=hiveary-agent
pkgver=1.4.0
pkgrel=1
pkgdesc="An intelligent server monitoring solution that automatically finds anomalies."
arch=(any)
url="http://hiveary.com"
license=('BSD')
groups=()
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=(etc/hiveary/hiveary.conf)
options=(!emptydirs)
install=
source=("http://pypi.python.org/packages/source/h/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "hiveary-agent.service")
md5sums=('ac85643fec74139ff7de00f5788f928e'
         'fa758e32c73734805449895afa259771')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 ${srcdir}/hiveary-agent.service ${pkgdir}/usr/lib/systemd/system/hiveary-agent.service
}

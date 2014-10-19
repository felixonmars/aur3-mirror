# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>

pkgname=python2-interruptingcow
pkgver=0.6
pkgrel=1
pkgdesc='Python watchdog that interrupts long running code'
arch=('any')
url='https://pypi.python.org/pypi/interruptingcow/0.6'
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/i/interruptingcow/interruptingcow-${pkgver}.tar.gz")
md5sums=('f31b238e72ce40239dd2275ccb73945f')

build() {
  cd interruptingcow-${pkgver}

  python2 setup.py build
}

package() {
  cd interruptingcow-${pkgver}

  python2 setup.py install \
    --root ${pkgdir} \
    --optimize=1

  install -D -m644 LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

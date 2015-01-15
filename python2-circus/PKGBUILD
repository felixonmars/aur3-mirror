# Maintainer: L42y <423300@gmail.com>

pkgname=python2-circus
_pkgname=circus
pkgver=0.11.1
pkgrel=1
pkgdesc="A Process & Socket Manager built with zmq"
url="http://circus.rtfd.org"
arch=('any')
license=('APL')
depends=("python2" "python2-pyzmq" "python2-psutil" "python2-iowait" "python2-tornado")
makedepends=("python2-setuptools")
backup=('etc/circus/circusd.ini')
source=(https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}.tar.gz)
md5sums=('6bcf26f99a77c020363a794b629cd706')

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  python2 setup.py install --root=${pkgdir}
  install -d ${pkgdir}/etc/circus/
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/debian/${_pkgname}d.ini ${pkgdir}/etc/circus/
  install -d ${pkgdir}/usr/lib/systemd/system/
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/debian/${_pkgname}.service ${pkgdir}/usr/lib/systemd/system/
}

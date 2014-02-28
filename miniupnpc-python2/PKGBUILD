## $Id$
## Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
## Contributor: Florian Loitsch <archlinux@florian.loitsch.com>
pkgname=miniupnpc-python2
_pkgname=miniupnpc
pkgver=1.9
pkgrel=1
pkgdesc="A small UPnP client library/tool to access Internet Gateway Devices"
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr"
license=('BSD')
depends=('python2' 'miniupnpc')
makedepends=('python2-setuptools')
source=("http://miniupnp.free.fr/files/${_pkgname}-${pkgver}.tar.gz"
	'miniupnpc-1.8-ansi.patch'
	'miniupnpc-1.8-python2.patch'
	'miniupnpc-1.9-setup.patch')
sha256sums=('2923e453e880bb949e3d4da9f83dd3cb6f08946d35de0b864d0339cf70934464'
	'b452e7037e1c9fc1bbe11038b68b66eadd4a6a5a5cd3d30f49534fabdfebc46d'
	'03df0143a59523398a675b9a70530d433c0f8b09b6e445927e2d71b0d399b8d8'
	'dc182eb532fae024c212a08223f5c25c43f371f3848f71a1585b6c66031b1a66')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for p in ${srcdir}/*.patch; do
    msg2 "Applying patch ${p##*/}"
    patch -sp1 < ${p} || return $?
  done
#  make pythonmodule
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
#  make PREFIX="${pkgdir}/" installpythonmodule
  python2 setup.py install --root="${pkgdir}" --optimize=1
#  install -Dm644 man3/miniupnpc.3 "${pkgdir}"/usr/share/man/man3/miniupnpc.3
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

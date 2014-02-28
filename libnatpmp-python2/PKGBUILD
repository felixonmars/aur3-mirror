## Maintainer: Kristjan Reinloo <mail at kreinloo dot net>
## Contributor: Pierre Bourdon <delroth@gmail.com>

pkgname=libnatpmp-python2
_pkgname=libnatpmp
pkgver=20131126
pkgrel=1
pkgdesc='A portable and fully compliant implementation of the NAT-PMP protocol'
arch=('i686' 'x86_64')
url="http://miniupnp.free.fr/libnatpmp.html"
license=('custom:BSD')
depends=('libnatpmp' 'python2')
makedepends=()
source=('http://miniupnp.free.fr/files/'${_pkgname}-${pkgver}.tar.gz
	'libnatpmp-20130911-python2.patch'
	'libnatpmp-20130911-setup.patch')
sha256sums=('48f1ffa3cbd3731c087790a5324f386c859100312298c06e7fd89d764a6ec2c4'
	'67dd2775328fcb6ad39ec9ff08bfee4a3a117c865ee883b9ce63f1ab8630ec46'
	'b7c9a1bff687505abe580eddc93d63b3460ab984212a38e84a28262a03f2167e')

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
#  make INSTALLPREFIX="${pkgdir}/usr" \
#       INSTALLDIRINC="${pkgdir}/usr/include/${_pkgname}" installpythonmodule
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

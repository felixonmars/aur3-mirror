# $Id: PKGBUILD 208827 2014-03-27 14:43:15Z fyan $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>

_pkgbase=pycrypto
pkgname='pypy-crypto'
pkgver=2.6.1
pkgrel=2
arch=('i686' 'x86_64')
makedepends=('pypy')
pkgdesc="Collection of cryptographic algorithms and protocols, implemented for use from Python 2."
depends=('pypy')
url="http://www.dlitz.net/software/pycrypto/"
license=('custom')
source=(http://ftp.dlitz.net/pub/dlitz/crypto/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz
	notfast.patch)
sha256sums=('f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c'
            '3c86baf65031f0aad7127c7b77f0b25e52b5a91679dd2e7f406f51c2d80907db')

prepare() {
  find ${_pkgbase}-${pkgver}/LEGAL -type f -exec chmod 644 {} \;
  find ${_pkgbase}-${pkgver}/LEGAL -type d -exec chmod 755 {} \;
 
#  cp -r ${_pkgbase}-${pkgver} ${_pkgbase}-${pkgver}-py3
}

build() {
  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i ${srcdir}/notfast.patch
  ./configure
  sed -i 's/HAVE_LIBGMP 1/HAVE_LIBGMP 0/' ${srcdir}/${_pkgbase}-${pkgver}/src/config.h
  pypy setup.py build
}

package() {
  cd ${_pkgbase}-${pkgver}
  pypy setup.py install --root="${pkgdir}" --optimize=1
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"
  cp -r LEGAL "${pkgdir}/usr/share/licenses/${pkgname}/"
}


check() {
  cd ${_pkgbase}-${pkgver}
  pypy setup.py test
}

# Contributor: Julian Pidancet <pidanc_j@epita.fr>

pkgname=tpm_keyring2
pkgver=0.1
pkgrel=2
pkgdesc="Key manager for TPM based eCryptfs keys"
arch=('i686')
url="http://sourceforge.net/projects/trousers"
license=('GPL')
depends=('openssl' 'trousers' 'swig' 'python2')
source=(http://downloads.sourceforge.net/sourceforge/trousers/${pkgname}-${pkgver}.tar.gz
        python27-fpic.patch)
md5sums=('b7d72616a4bf7ad7893b13ffcba8e0a5'
         '162a02f84f0bbac86fd851c7df12ae14')

build() {
  cd ${srcdir}
  patch -p 0 < python27-fpic.patch

  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/
  install _tpm_keyring_util.so ${pkgdir}/usr/lib/python2.7/site-packages/
  install -m0644 tpm_keyring_util.py ${pkgdir}/usr/lib/python2.7/site-packages/

  install -d ${pkgdir}/usr/bin/
  install tpm_keyring ${pkgdir}/usr/bin/

  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m0644 sandoval.ttf ${pkgdir}/usr/share/fonts/TTF/
}

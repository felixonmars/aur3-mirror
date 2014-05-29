# PKGBUILD marekpetrik@gmail.com
# Updated for 64 bit architecture (but broke 32 bit compatibility)
# Based on the work of yhager@yhager.com
# Based on the work of Dario Bazzichetto (published in http://attnetclient.com/forum/viewtopic.php?f=12&t=1017&start=0)
pkgname=agnclient
pkgver=1.0_2.0.1
_buildver=3003
pkgrel=8
pkgdesc='AT&T Global Network Client'
arch=('x86_64')
_arch=i386
license=('custom')
url="http://attnetclient.com"
source=("ftp://ftp.attglobal.net/pub/custom/ibm_linux/${pkgname}-${pkgver//_/-}.${_buildver}.${_arch}.rpm" 'agnclientd' 'agnLogd' 'agncli')
sha1sums=('d08eb03d6ca6089eed55f5ef9ad27814d84f1cb3'
          'b9adae784f085570fc2c92f8919b250bc6659b2a'
          '698e9476e640a45b79579a03817a90d20d4b0249'
          'e7dc0a8e37e97374aed0a576bc06f50ea131323b')

depends=('openssl' 'lib32-glibc' 'lib32-gtk2' 'lib32-libxml2' 'lib32-curl' 'lib32-pangox-compat')
makedepends=('libarchive')
install=agnclient.install

build() {
  cd ${pkgdir}
  bsdcpio -id < ${srcdir}/${pkgname}-${pkgver//_/-}.${_buildver}.${_arch}.rpm
  rm -r etc/rc.d/init.d
  cp ${srcdir}/agnclientd ${srcdir}/agnLogd etc/rc.d/.
  install -D ${srcdir}/agncli usr/bin/agncli
}

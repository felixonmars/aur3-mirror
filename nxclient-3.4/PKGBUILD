# $Id: PKGBUILD 24474 2009-01-17 18:42:23Z andyrtr $
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
#Contributed: eliott <eliott@solarblue.net>, Andre Naumann <anaumann@SPARCed.org> 
_pkgname=nxclient
pkgname=${_pkgname}-3.4
pkgver=3.4.0
_minorver=-5
pkgrel=2
pkgdesc="Nomachine's nxclient for nx servers"
arch=(i686 x86_64)
url="http://nomachine.com"
makedepends=('rpmextract')
license=('custom:nomachine')
depends=('cups' 'libcups' "nx-common-3.4>=${pkgver}" 'libxext' 'libxft' 'xorg-xauth')
conflicts=('nxclient')
[ "$CARCH" = "x86_64" ] && source=(http://64.34.161.181/download/${pkgver}/Linux/${_pkgname}-${pkgver}${_minorver}.x86_64.rpm nomachine.key)
[ "$CARCH" = "x86_64" ] && md5sums=('4227c45b2ecc723ab57621dc714cd82b'
         'cb5df74aff5160eab9cd4313019ae228')
[ "$CARCH" = "i686" ] && source=(http://64.34.161.181/download/${pkgver}/Linux/${_pkgname}-${pkgver}${_minorver}.i386.rpm nomachine.key)
[ "$CARCH" = "i686" ] && md5sums=('2701166ca91ba76892d7559407bd21be'
         'cb5df74aff5160eab9cd4313019ae228')
install=nxclient.install

build() {
  cd $startdir/src
  rpmextract.sh *.rpm
  rm usr/NX/bin/nxssh usr/NX/bin/nxesd
  rm -r usr/NX/lib
  rm usr/NX/share/keys/server.id_dsa.key
  sed -i -e 's,/usr/NX,/opt/NX,g' etc/profile.d/nx.sh etc/profile.d/nx.csh
  sed -i -e 's,/usr/NX/,/opt/NX/,g' ${srcdir}/usr/NX/share/applnk/network/*.desktop
  #sed -i -e 's,/bin/nxclient,/bin/nxclient-nomachine,g' ${srcdir}/usr/NX/share/applnk/network/*.desktop

  install -D -m 755 ${srcdir}/etc/profile.d/nx.sh ${pkgdir}/etc/profile.d/nx.sh 
  install -D -m 755 ${srcdir}/etc/profile.d/nx.csh ${pkgdir}/etc/profile.d/nx.csh 
  install -D -m 644 ${srcdir}/usr/NX/share/applnk/network/nxclient-wizard.desktop ${pkgdir}/usr/share/applications/nxclient-wizard.desktop
  install -D -m 644 ${srcdir}/usr/NX/share/applnk/network/nxclient.desktop ${pkgdir}/usr/share/applications/nxclient.desktop
  install -D -m 644 ${srcdir}/usr/NX/share/applnk/network/nxclient-admin.desktop ${pkgdir}/usr/share/applications/nxclient-admin.desktop
  rm -r ${srcdir}/usr/NX/share/applnk
  cd usr
  mkdir -p ${pkgdir}/opt
  mv NX ${pkgdir}/opt
  # add default key file
  install -D -m 644 ${srcdir}/nomachine.key ${pkgdir}/opt/NX/share/keys/server.id_dsa.key
  #mv ${pkgdir}/opt/NX/bin/nxclient ${pkgdir}/opt/NX/bin/nxclient-nomachine
  # add license file
  mkdir -p ${pkgdir}/usr/share/licenses/nxclient
  mv ${pkgdir}/opt/NX/share/documents/client/license-info ${pkgdir}/usr/share/licenses/nxclient/LICENSE
}

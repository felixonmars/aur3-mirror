# Maintainer: Xabre <Xabre_666@operamail.com>

pkgname=openoffice-beta-sh
pkgver=3.3.0beta1
pkgrel=1
pkgdesc="OpenOffice.org beta serbian  language files (latin)."
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('GPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs')
source=(http://ftp-1.gwdg.de/pub/openoffice/extended/${pkgver}/OOo-Dev_${pkgver}_Linux_x86_langpack-rpm_sh.tar.gz)

md5sums=('dfddb3624ed9091f40510ad5bbf6545d')

build() {
  cd "${srcdir}"/*native_packed*/RPMS

  for i in *.rpm
     do rpmextract.sh $i
  done

#install openoffice language files
  install -d "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org/basis3.3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  chown root:root -R "${pkgdir}/usr/lib/openoffice-beta"
}

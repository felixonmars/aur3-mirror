# Maintainer: Xabre <Xabre_666@operamail.com>

pkgname=openoffice-beta-sr
pkgver=3.3.0beta1
pkgrel=1
pkgdesc="OpenOffice.org beta serbian  language files (cyrilic)."
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('GPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs')
source=(http://ftp-1.gwdg.de/pub/openoffice/extended/${pkgver}/OOo-Dev_${pkgver}_Linux_x86_langpack-rpm_sr.tar.gz)

md5sums=('6b0b5811774d2d868f975b6bd9d970fe')

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

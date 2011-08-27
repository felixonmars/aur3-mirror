# Maintainer: Jannick Kuhr <opensource@kuhr.org>

pkgname=openoffice-beta-de
pkgver=3.3.0beta1
pkgrel=1
pkgdesc="German i18n for OpenOffice.org beta."
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('GPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs')
source=(http://ftp-1.gwdg.de/pub/openoffice/extended/${pkgver}/OOo-Dev_${pkgver}_Linux_x86_langpack-rpm_de.tar.gz)

md5sums=('1b273a4b59b1f610cdc3bcb72ea2a650')

build() {
  cd "${srcdir}"/*native_packed*/RPMS

  for i in *.rpm
     do rpmextract.sh $i
  done

#install openoffice language files
  install -d "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/ooo-dev/basis3.3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/ooo-dev/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  chown root:root -R "${pkgdir}/usr/lib/openoffice-beta"
}

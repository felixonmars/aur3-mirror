# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=openoffice-beta-cs
pkgver=3.1.0rc2
pkgrel=2
pkgdesc="OpenOffice czech language files."
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('GPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs')
source=(http://ftp-1.gwdg.de/pub/openoffice/extended/${pkgver}/OOo_${pkgver}_20090427_LinuxIntel_langpack_cs.tar.gz)

md5sums=('583c438deaae233f88ac9af04ac20593')

build() {
  cd "${srcdir}"/*native_packed*/RPMS

  for i in *.rpm
     do rpmextract.sh $i
  done

#install openoffice language files
  install -d "${pkgdir}/opt/openoffice-beta/basis-link"
  cp -R opt/openoffice.org/basis3.1/* "${pkgdir}/opt/openoffice-beta/basis-link"
  cp -R opt/openoffice.org3/* "${pkgdir}/opt/openoffice-beta/basis-link"
  chown root:root -R "${pkgdir}/opt/openoffice-beta"
}

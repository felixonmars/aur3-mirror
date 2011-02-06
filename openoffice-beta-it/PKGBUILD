# Maintainer: paolo <paolostivanin@gmail.com>

pkgname=openoffice-beta-it
pkgver=3.3.0rc5
pkgdate=20101115
pkgrel=1
_srcurl=http://ftp-1.gwdg.de/pub/openoffice/extended
pkgdesc="OpenOffice.org beta italian language files"
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('LGPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs' '!libtool')

_source_x86=(${_srcurl}/${pkgver}/OOo-Dev_${pkgver}_${pkgdate}_Linux_x86_langpack-rpm_it.tar.gz)
_md5sums_x86=('bcceb64b3139bad48e74c7b10b483bb0')

_source_x86_64=(http://ftp-1.gwdg.de/pub/openoffice/extended/${pkgver}/OOo_${pkgver}_${pkgdate}Linux_x86-64_langpack-rpm_it.tar.gz)
_md5sums_x86_64=('d4c328241bb0c495657e1ba3cf6b47bb')

source=(${_source_x86[@]})
md5sums=(${_md5sums_x86[@]})
[ "$CARCH" = "x86_64" ] && source=(${_source_x86_64[@]}) && md5sums=(${_md5sums_x86_64[@]})

build() {
  cd "${srcdir}"/*native_packed*/RPMS

  for i in *.rpm
     do rpmextract.sh $i
  done

# Now i'm installing openoffice-3.3.0rc5 italian language files
  install -d "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org/basis3.3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  chown root:root -R "${pkgdir}/usr/lib/openoffice-beta"
}

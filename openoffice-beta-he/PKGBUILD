# Maintainer: Assaf Sapir <meijin007 AT gmail.com>
# Original version in Italy: paolo <paolostivanin@gmail.com>

pkgname=openoffice-beta-he
pkgver=3.3.0rc7
pkgrel=1
_srcurl=http://download.services.openoffice.org/files/extended
pkgdesc="OpenOffice.org beta Hebrew language files"
arch=('i686' 'x86_64')
url="http://www.openoffice.org"
license=('LGPL')
makedepends=('rpmextract')
depends=('openoffice-base-beta')
options=('!emptydirs' '!libtool')
_source_x86=(${_srcurl}/${pkgver}/OOo_${pkgver}_20101126_Linux_x86_langpack-rpm_he.tar.gz)
_md5sums_x86=('19a75d0d06ef8766ed411a9aea6df5b4')

_source_x86_64=(${_srcurl}/${pkgver}/OOo_${pkgver}_20101126_Linux_x86-64_langpack-rpm_he.tar.gz)
_md5sums_x86_64=('916d92ae48cdf16a877d5af20e4135aa')

source=(${_source_x86[@]})
md5sums=(${_md5sums_x86[@]})
[ "$CARCH" = "x86_64" ] && source=(${_source_x86_64[@]}) && md5sums=(${_md5sums_x86_64[@]})

build() {
  cd "${srcdir}"/*native_packed*/RPMS

  for i in *.rpm
     do rpmextract.sh $i
  done

# Now i'm installing openoffice-3.3.0b1 italian language files
  install -d "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org/basis3.3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  cp -R opt/openoffice.org3/* "${pkgdir}/usr/lib/openoffice-beta/basis-link"
  chown root:root -R "${pkgdir}/usr/lib/openoffice-beta"
}

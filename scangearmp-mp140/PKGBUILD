# Mantainer: William Díaz <wdiaz@archlinux.us>

pkgname=scangearmp-mp140
_pkgname=scangearmp
pkgver=1.10
pkgrel=1
pkgdesc="Canon Scanner Driver (For Multifunction MP140)"
url="http://software.canon-europe.com/software/0028482.asp"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane')
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft28482/software/28482.tgz)
md5sums=('9a3981abaabd6129603ee6f550825bd6')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  rpmextract.sh ${_pkgname}-common-${pkgver}-1.i386.rpm
  rpmextract.sh ${_pkgname}-mp140series-${pkgver}-1.i386.rpm
  mv "etc" "usr" ${pkgdir}
}

# Mantainer: Jasuramme <Jasuramme@mail.ru>

pkgname=scangearmp-mp140-with-common
_pkgname=scangearmp
pkgver=1.10
pkgrel=1
pkgdesc="Canon Scanner Driver (For Multifunction MP140) updated for newer common scangearmp package"
url="http://software.canon-europe.com/software/0028482.asp"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane'
	'scangearmp-common')
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft28482/software/28482.tgz)
md5sums=('9a3981abaabd6129603ee6f550825bd6')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  rpmextract.sh ${_pkgname}-common-${pkgver}-1.i386.rpm
  rpmextract.sh ${_pkgname}-mp140series-${pkgver}-1.i386.rpm
  mv "etc" "usr" ${pkgdir}
  rm ${pkgdir}/usr/lib/bjlib/canon_mfp.conf
  rm ${pkgdir}/usr/lib/libsane-canon_mfp.so
  rm -r ${pkgdir}/etc
  rm ${pkgdir}/usr/lib/libcncpmsimg.so.1.0.1
  rm ${pkgdir}/usr/lib/libcncpmsui.so.1.1.0
  rm ${pkgdir}/usr/lib/libcncpcmcm.so.6.50.1
}

pkgname=scangearmp-mp540
_pkgname=scangearmp
pkgver=1.20
pkgrel=1
pkgdesc="Canon Scanner Driver (For Multifunction MP540)"
url="http://software.canon-europe.com/products/0010641.asp"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane')
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft31329/software/MP540_RPM_drivers.tar)
md5sums=('a4b9d98fd1269668254a0f70181bdba9')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  tar -xf MP540_RPM_scangear.tar
  rpmextract.sh ${_pkgname}-common-${pkgver}-1.i386.rpm
  rpmextract.sh ${_pkgname}-mp540series-${pkgver}-1.i386.rpm
  mv "etc" "usr" ${pkgdir}
}

# Maintainer: JSkier, jskier.com
# Created by Gillen Dan
# Fred (Forensic Registry EDitor), Debian binary version

pkgname=fred-reports-deb
pkgver=0.1.1
pkgrel=2
pkgdesc="Digital forensics tool templates for FRED, deb binary, works with source of FRED"
arch=("i686" "x86_64")
url="https://www.pinguin.lu/index.php"
license=("LGPL3")
depends=("fred")
options=(!emptydirs)
if [ "${CARCH}" = "x86_64" ]; then 
   _ar=amd64
   md5sums[0]=23e5417640c3dfb0824c99c3834e2a6b
else
   _ar=i386
   md5sums[0]=1c18cc1d6c2eb42dbde1072b03914019
fi

source=("http://deb.pinguin.lu/amd64/fred-reports_${pkgver}_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar -xf data.tar.gz -C "${pkgdir}"
}
md5sums=('23e5417640c3dfb0824c99c3834e2a6b')

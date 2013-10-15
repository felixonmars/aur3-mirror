# Maintainer: JSkier, jskier.com
# Created by Gillen Dan
# Fred (Forensic Registry EDitor), Debian binary version

pkgname=fred-deb
pkgver=0.1.0beta5
pkgrel=1
pkgdesc="Digital forensics tool for viewing and reporting on Windows registry files, deb binary"
arch=("i686" "x86_64")
url="https://www.pinguin.lu/index.php"
license=("LGPL3")
depends=("qt4" "hivex")
makedepends=("qt4" "hivex")
conflicts=("fred")
provides=("fred")
options=(!emptydirs)
if [ "${CARCH}" = "x86_64" ]; then 
   _ar=amd64
   md5sums[0]=2dadd29be9598ae63c1ad1c2c68e5255
else
   _ar=i386
   md5sums[0]=4dd74032c827d80cd967e99341b3c880
fi

source=("http://deb.pinguin.lu/amd64/fred_0.1.0beta5_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar -xf data.tar.gz -C "${pkgdir}"
}

pkgname=xerox-workcentre6605
pkgver=5.10.289.1486
pkgrel=1
pkgdesc="driver for the Xerox Workcentre 6605"
arch=('i686' 'x86_64')
url="http://www.support.xerox.com/support/workcentre-6605/downloads/frfr.html?operatingSystem=linux&fileLanguage=fr"
license=('custom')
depends=('cups')
makedepends=('rpmextract')
_pkg="Xeroxv5Pkg-Linux${CARCH}-${pkgver}"
source=("http://download.support.xerox.com/pub/drivers/7100/drivers/linux/cs/${_pkg}.sh")

if [ "$CARCH" = "i686" ]; then
  md5sums=('94d8a00c970a8e2e758ad79d93260c9d')
elif [ "$CARCH" = "x86_64" ]; then
  md5sums=('e3b7383b568f5e493eee626cfc27a427')
fi

prepare() {
  cd ${srcdir}
  sed -e'1,49d' ${_pkg}.sh > ${_pkg}.tgz
  tar xf ${_pkg}.tgz 

}

package() {
  cd ${pkgdir}
  /bin/rpmextract.sh ${srcdir}/${_pkg}.rpm
}

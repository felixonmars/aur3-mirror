# Contributor: Ken Cecka <ceckak@alumni.washington.edu>
# Copied from Caleb Maclennan's 6500 PKGBUILD
pkgname=cups-xerox-phaser-6280
pkgver=1.0.0
pkgrel=1
_tarname=6280_Linux.tar
_rpmname=6280_Linux/English/Xerox-Phaser-6280-1.0-1.noarch.rpm
pkgdesc="CUPS driver for the Xerox Phaser 6280 series"
url="http://www.support.xerox.com/support/phaser-6280/downloads/enus.html?operatingSystem=linux&fileLanguage=en"
license=('custom')
arch=('i686' 'x86_64')
depends=('cups' 'cups-filter-oopstops')
makedepends=('tar' 'rpmextract' 'libtool')
source=(http://download.support.xerox.com/pub/drivers/6280/drivers/linux/en/6280_Linux.tar)
md5sums=('badf55690c5abf29d8fc0327dfd18f1d')

build() {
  cd ${srcdir}
  tar xf ${_tarname}
  rpmextract.sh ${_rpmname} || return 1
  cd ${srcdir}/usr/share/cups/model/Xerox
  for gz in *.ppd.gz; do
  {
    gunzip $gz
    ppd=$(basename $gz .gz)
    sed -i '/cupsVersion/a *cupsPreFilter: "application/vnd.adobe-reader-postscript 0 oopstops"' $ppd
    gzip $ppd
  }
  done
}

package() {
  cd ${srcdir}
  cp -r usr ${pkgdir}
}

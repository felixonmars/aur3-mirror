# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributer: Sebastian Sareyko <public@nooms.de>

pkgname=mpdcon
pkgver=1.3
pkgrel=4
pkgdesc='A simple GNUstep controller for MPD'
arch=('i686' 'x86_64')
url='http://www.musicpd.org/MPDCon.shtml'
license=('GPL')
depends=('gnustep-back' 'gnustep-gui')
makedepends=('gnustep-make' 'gcc-objc')
source=("http://savannah.nongnu.org/download/gap/MPDCon-${pkgver}.tar.gz")
md5sums=('1b2a49346eac3fa75f14faa50fed29f6')

build() {
  cd MPDCon-${pkgver}

  if [ -z "${GNUSTEP_USER_CONFIG_FILE}" ] ; then
    . /etc/profile.d/GNUstep.sh
  fi

  make
}

package() {
  cd MPDCon-${pkgver}

  make DESTDIR=$pkgdir install
} 

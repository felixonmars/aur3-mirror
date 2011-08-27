# Syco <SycoLTH at gmail dot com>

pkgname=alsa-driver.hda-intel.hda-codec-realtek
_pkgname=alsa-driver
pkgver=1.0.24
pkgrel=0
pkgdesc="An alternative implementation of Linux sound support"
arch=('i686' 'x86_64')
provides=(alsa-driver)
install='alsa-driver.install'
url="http://www.alsa-project.org"
license=('GPL')
options=(!libtool)
source=(ftp://ftp.alsa-project.org/pub/driver/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('a4ffd80745ce5098dfd48d83c2769e0e')

build() {
  k_updates=${pkgdir}/lib/modules/$(uname -r)/updates
  install -d ${k_updates}
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --with-cards=hda-intel --with-card-options=hda-codec-realtek
  make || return 1
  install -D -m644 modules/*.ko ${k_updates} || return 1
}

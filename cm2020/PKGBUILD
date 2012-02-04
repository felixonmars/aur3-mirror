# Creator: Peter Feigl <craven@gmx.net>
pkgname=cm2020
pkgver=1
pkgrel=1
pkgdesc="Driver for the Omnikey Cardman 2020"
url="http://wiki.gula.es/index.php?title=HOWTO_Omnikey_Cardman_2020_USB"
arch=(i686)
license=(unknown)
depends=(pcsclite)
# pwc, ieee80211 and hostap-driver26 modules are included in kernel26 now
# nforce package support was abandoned by nvidia, kernel modules should cover everything now.
# kernel24 support is dropped since glibc24
source=(install)
build() {
  cd ${srcdir}
  svn co http://svn.gula.es/cm2020
  cd cm2020
  echo "Removing .svn directories"
  find . -name .svn | xargs rm -R
  cp ../install .
  pkgdir=${pkgdir} ./install
}

md5sums=('ee789d7ba45244dd6a0417083722d50d')

# Contributor: Troels Liebe Bentsen <tlb@rapanden.dk>
_modname=madwifi
pkgname=dkms-madwifi
pkgver=0.9.3.1
pkgrel=2
pkgdesc="Madwifi drivers for Atheros wireless chipsets."
arch=(i686 x86_64)
url="http://madwifi.org"
license=("GPL")
depends=('dkms' 'madwifi-utils')
replace=('madwifi' 'madwifi-suspend2' 'madwifi-ck')
conflicts=('madwifi' 'madwifi-suspend2' 'madwifi-ck')
provides=('madwifi' 'madwifi-suspend2' 'madwifi-ck')
install=madwifi.install
source=(http://heanet.dl.sourceforge.net/madwifi/madwifi-${pkgver}.tar.bz2
    dkms.conf)

md5sums=('4704b0e09d76d616217f89de87e4a1ac'
         'c0da6c2c26476654ad592a07e567e3bb')

build() {
  cd $startdir/src/$_modname-$pkgver
  mkdir -p $startdir/pkg/usr/src/$_modname-$pkgver-$pkgrel
  cp -a ath/ ath_hal/ ath_rate/ hal/ include/ net80211/ scripts/ BuildCaps.inc kernelversion.c Makefile Makefile.inc release.h $startdir/pkg/usr/src/$_modname-$pkgver-$pkgrel/
  sed -i -e "s/PACKAGE_VERSION=\".*\"/PACKAGE_VERSION=\"${pkgver}-${pkgrel}\"/" $startdir/dkms.conf
  cp $startdir/dkms.conf $startdir/pkg/usr/src/$_modname-$pkgver-$pkgrel/
}

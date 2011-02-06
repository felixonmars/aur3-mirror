# Contributor: Hugo Doria <hugodoria@gmail.com>

pkgname=rtl8180
pkgver=0.22_pre20070726
_kernver=2.6.23-ARCH
pkgrel=1
pkgdesc="rtl8180 wlan drivers"
url="http://rtl8180-sa2400.sourceforge.net/"
license=('GPL')
arch=('i686')
depends=('kernel26>=2.6.23')
source=('http://hdoria.archlinux-br.org/packages/rtl8180-0.22_pre20070726.tar.bz2')
md5sums=('bd1a30930715cba7155a7e76b826250a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  make || return 1
  
  mkdir -p ${startdir}/pkg/lib/modules/2.6.23-ARCH/r8180

  install -D -m644 ieee80211_crypt-rtl.ko      ${startdir}/pkg/lib/modules/${_kernver}/ieee80211_crypt-rtl.ko
  install -D -m644 ieee80211_crypt_wep-rtl.ko  ${startdir}/pkg/lib/modules/${_kernver}/ieee80211_crypt_wep-rtl.ko
  install -D -m644 ieee80211_crypt_tkip-rtl.ko ${startdir}/pkg/lib/modules/${_kernver}/ieee80211_crypt_tkip-rtl.ko
  install -D -m644 ieee80211_crypt_ccmp-rtl.ko ${startdir}/pkg/lib/modules/${_kernver}/ieee80211_crypt_ccmp-rtl.ko
  install -D -m644 ieee80211-rtl.ko            ${startdir}/pkg/lib/modules/${_kernver}/ieee80211-rtl.ko
  install -D -m644 r8180.ko ${startdir}/pkg/lib/modules/$_kernver/kernel/r8180.ko
}

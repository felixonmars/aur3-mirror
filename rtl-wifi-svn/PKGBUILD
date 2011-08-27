# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=rtl-wifi-svn
pkgver=62
pkgrel=1
pkgdesc="Drivers for Realtek WiFi cards - module for kernel26"
arch=('i686' 'x86_64')
url="http://rtl-wifi.sourceforge.net/"
license=('GPL')
depends=('kernel26')
provides=('rtl-wifi')
conflicts=('rtl-wifi')
install=rtl-wifi.install
source=()
md5sums=()

_svntrunk=http://rtl-wifi.svn.sourceforge.net/svnroot/rtl-wifi
_svnmod=rtl-wifi
_kernver=2.6.22-ARCH

build() {
  cd $startdir/src
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  make || return 1

  install -D -m644 ieee80211/ieee80211_crypt-rtl.ko      $startdir/pkg/lib/modules/$_kernver/kernel/net/ieee80211/rtl-wifi/ieee80211_crypt-rtl.ko
  install -D -m644 ieee80211/ieee80211_crypt_wep-rtl.ko  $startdir/pkg/lib/modules/$_kernver/kernel/net/ieee80211/rtl-wifi/ieee80211_crypt_wep-rtl.ko
  install -D -m644 ieee80211/ieee80211_crypt_tkip-rtl.ko $startdir/pkg/lib/modules/$_kernver/kernel/net/ieee80211/rtl-wifi/ieee80211_crypt_tkip-rtl.ko
  install -D -m644 ieee80211/ieee80211_crypt_ccmp-rtl.ko $startdir/pkg/lib/modules/$_kernver/kernel/net/ieee80211/rtl-wifi/ieee80211_crypt_ccmp-rtl.ko
  install -D -m644 ieee80211/ieee80211-rtl.ko            $startdir/pkg/lib/modules/$_kernver/kernel/net/ieee80211/rtl-wifi/ieee80211-rtl.ko

  install -D -m644 rtl8187-newstack/r8187.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/r8187.ko
  install -D -m644 rtl818x-newstack/r8180.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/r8180.ko

  # Update kernel version in .install script
  sed -i -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" $startdir/rtl-wifi.install
}

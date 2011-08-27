# Contributor: hydro <hydro@freenet.de>

pkgname=wl_lkm
pkgver=7.18
pkgrel=10
pkgdesc="Agere WLAN driver (WEP/WPA) for Hermes-I/II chipset"
arch=('i686')
url="http://www.lsi.com"
license="BSD"
depends=()
install=wl_lkm.install
_kernver=$(uname -r)
source=(http://arvidjaar.newmail.ru/wlags49.tar.bz
        wlags49.patch
	hermes2.patch)
md5sums=('3e3503bdcf4673b2c4511a1e1689010c'
         '7a026d91f8c3fcde9fdb6fc6d48bd492'
         '9b60eb718ff755bf3e172e08ebf39a0b')
build() {
  cd $startdir/src/wlags49/
  patch -p1 -i ../wlags49.patch

# Uncomment the following line to build Hermes II module
#  patch -p1 -i ../hermes2.patch

make -C /usr/src/linux-$(uname -r)  M=$(pwd) || return 1
  install -d $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/
  install -m 0644 -o root -g root wlags49_h[12]_cs.ko $startdir/pkg/lib/modules/$_kernver/kernel/drivers/net/wireless/
}


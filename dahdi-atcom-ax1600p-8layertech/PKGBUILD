#
# Created by: Joel Bryan Juliano <jbjuliano@8layertech.com>,
#                                <joelbryan.juliano@gmail.com>
#
# This package is part of 8ix Zenith CE project.
# For more information, visit http://www.8layertech.com
#
pkgname=dahdi-atcom-ax1600p-8layertech
pkgver=2.2.0.1
pkgrel=1
pkgdesc="DAHDI drivers for Asterisk with OSLEC Echo Canceller (For ATCOM AX1600P 16-Port TDM)"
arch=('i686' 'x86_64')
url="http://www.asterisk.org/"
license=('GPL2')
depends=('libusb' 'perl' 'kernel26-source')
conflicts=('zaptel')
install="$pkgname.install"
source=("http://downloads.digium.com/pub/telephony/dahdi-linux/releases/dahdi-linux-${pkgver}.tar.gz"
        "http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-064-1.05.01.tar.gz"
        "http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-oct6114-128-1.05.01.tar.gz"
        "http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fw-tc400m-MR6.12.tar.gz"
        "http://downloads.digium.com/pub/telephony/firmware/releases/dahdi-fwload-vpmadt032-1.17.0.tar.gz"
        "http://www.atcom.cn/down/program/en/card/wctdm.c.v1.6"
        "dahdi-oslec-8layertech.patch")
md5sums=('824919c1ee040a3c1999b4f70dd17c4a'
         '88db9b7a07d8392736171b1b3e6bcc66'
         'c1f1a18d3e20d283f42c71e580a64b5a'
         '2ea860bb8a9d8ede2858b9557b74ee3c'
         'c250a0df0745b2fd43c1698c2605dc30'
         '394981bcb773cb8b8ebc3752a8eaeb1a'
         'e85c2d180be19e5127be8e1f41021b16')

build() {

  cp "$srcdir/wctdm.c.v1.6" "$srcdir/dahdi-linux-${pkgver}/drivers/dahdi/wctdm.c"
  
  ln -s "$srcdir"/dahdi-fw*.tar.gz "$srcdir/dahdi-linux-${pkgver}/drivers/dahdi/firmware/" || return 1
  mv "$srcdir"/dahdi-fw*.bin "$srcdir/dahdi-linux-${pkgver}/drivers/dahdi/firmware/" || return 1
  cp -R "$srcdir"/drivers "$srcdir/dahdi-linux-${pkgver}" || return 1
  mkdir -p "$srcdir/dahdi-linux-${pkgver}/drivers/staging" || return 1
  cp -R /usr/src/linux-$(uname -r | sed 's/-ARCH//g')/drivers/staging/echo "$srcdir/dahdi-linux-${pkgver}/drivers/staging/" || return 1
  echo 'obj-m += echo.o' > "$srcdir/dahdi-linux-${pkgver}/drivers/staging/echo/Kbuild"
  cd "$srcdir/dahdi-linux-${pkgver}"
  patch -Np1 -i "$srcdir/dahdi-oslec-8layertech.patch" || return 1
  make DESTDIR="$pkgdir/" modules || return 1
  make DYNFS=1 DESTDIR="$pkgdir/" install
  
}

# vim:set ts=2 sw=2 et:

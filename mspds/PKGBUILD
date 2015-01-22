# Maintainer: Your Name <youremail@domain.com>
pkgname=mspds
pkgver=3.4.3.004
pkgrel=1
pkgdesc="MSP430 Debug Stack. Contains a dynamic link library as well as embedded firmware that runs on the MSP-FET430UIF or the eZ430 emulators."
arch=('i686' 'x86_64')
url="http://processors.wiki.ti.com/index.php/MSPDS_Open_Source_Package"
license=('custom:TI Open Source')
group=('msp430')
depends=('hidapi' 'boost')
makedepends=('unzip' 'dos2unix')
optdepends=('mspdebug-git')
source=("http://www-s.ti.com/sc/techzip/slac460.zip"
        "https://github.com/jck/mspds/releases/download/v${pkgver}/v${pkgver}.patch")

prepare() {
  find . -type f -exec dos2unix -q '{}' \;
  patch -p1 -d MSPDebugStack_OS_Package < ../v3.4.3.004.patch
}

build() {
	cd "$srcdir/MSPDebugStack_OS_Package"
	make
}

package() {
  install -Dm644 "$srcdir/MSPDebugStack_OS_Package/libmsp430.so" "$pkgdir/usr/lib/libmsp430.so"
}
md5sums=('0ebedd72ec46a2b53d20a34d47b4d70b'
         'fc3133fdc125145d2d8b25a646bebd88')

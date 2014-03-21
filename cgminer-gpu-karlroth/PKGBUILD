# Maintainer: nilux <marko at paasila dot net>
# Contributor: ilikenwf <parwok at gmail dot com>
# Contributor: deusstultus <deusstultus at gmail dot com>
# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars atgmail dot com>
# Contributor: monson <holymonson at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david at davidmanouchehri dot com>
# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

pkgname=cgminer-gpu-karlroth
provides=('cgminer')
pkgver=3.7.3
pkgrel=1
pkgdesc="Multi-thread multi-pool GPU miner for cryptocoins. You must download ADL first: http://developer.amd.com/tools-and-sdks/graphics-development/display-library-adl-sdk/"
url='http://k-dev.net/cgminer/kalroth-changes.txt'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('curl' 'libcl' 'libusbx' 'jansson' 'libusb-compat')
conflicts=('cgminer-git' 'cgminer' 'cgminer-git-adl' 'cgminer-gpu' 'cgminer-gpu-adl')
makedepends=('opencl-headers')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
source=("https://github.com/Kalroth/cgminer-3.7.2-kalroth/archive/master.zip"
        "cgminer.service"
        "cgminer.conf.d"
        "ADL_SDK_6.0.zip"
        )
sha512sums=('SKIP'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '4af430f0a0eac347b0e3df39999abbf7a4281a1b01398845fd8e826b69c28b67fc062092eac0ef207ace943006ed4ccd8c6017049c2dfd3945914ea6153026f3')
noextract=('ADL_SDK_6.0.zip')
[ "$CARCH" == "x86_64" ] && makedepends+=('yasm')

prepare() {
  unzip -jod "$srcdir/cgminer-3.7.2-kalroth-master/ADL_SDK/" "$srcdir/ADL_SDK_6.0.zip" "include/*.h"
  unzip -od "$srcdir/AMD_ADL_SDK" "$srcdir/ADL_SDK_6.0.zip" "Public-Documents/ADL*"
}

build() {
  cd "$srcdir/cgminer-3.7.2-kalroth-master"

  ./autogen.sh --enable-opencl

  ./configure \
    --prefix=/usr \
    --enable-scrypt \
    --enable-opencl \
    --enable-bflsc \
    --enable-bitforce \
    --enable-icarus \
    --enable-modminer \
    --enable-ztex \
    --enable-avalon \
    --enable-adl

  make
}

package() {
  cd "$srcdir/cgminer-3.7.2-kalroth-master"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/cgminer.service "$pkgdir"/usr/lib/systemd/system/cgminer.service
  install -Dm644 "$srcdir"/cgminer.conf.d "$pkgdir"/etc/conf.d/cgminer
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > cgminer.conf
  install -Dm644 cgminer.conf "$pkgdir"/etc/cgminer.conf
}
# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>

# Contributors by way of cgminer-gpu package in AUR
# Contributor: ilikenwf <parwok@gmail.com>
# Contributor: deusstultus <deusstultus@gmail.com>
# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

pkgname=cgminer-keccak
provides=('cgminer')
pkgver=3.6.5
pkgrel=1
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin and derivative coins. Added Copper Lark support."
url='https://github.com/Eropi4/cgminer_keccak'
license=('GPL3')
arch=('i686' 'x86_64')
depends=('curl' 'libcl' 'libusbx' 'jansson' 'libusb-compat')
conflicts=('cgminer-gpu cgminer-git' 'cgminer' 'cgminer-git-adl')
makedepends=('opencl-headers')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
source=("https://github.com/Eropi4/cgminer_keccak/archive/v3.6.5-keccak.tar.gz"
		"cgminer.service"
		"cgminer.conf.d"
        "system-jansson-libusb.patch")
sha512sums=('4a5d9373c7f3cd161ff19dfa0237ad9e98f9055b46decbba49ea3edaefb5ecff1eda88bcae839a2301984d9288e8646992e1e4e9b4b88f2a34d0d85373bf9254'
	'3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f'
	'99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
	'39968a2baad232f31a9c888a28e6c3cfe1e0bf0499753ab3a9db786db9024129e25705a3e8d0b8e3bd78efa83abdfb0b3c2dc1367aae0c8c8d4fa5ae9167c2d2')
[ "$CARCH" == "x86_64" ] && makedepends+=('yasm')

build() {
  cd "${srcdir}/cgminer_keccak-${pkgver}-keccak"
	
  # We have latest jansson and libusb - just use them
  patch -Np1 -i ../system-jansson-libusb.patch
  rm -r compat
  
  ./autogen.sh \
  --enable-opencl \
  --prefix=/usr \
  --enable-scrypt \
  --enable-opencl \
  --enable-adl \
  --enable-keccak
    
  make
}

package() {
  cd "${srcdir}/cgminer_keccak-${pkgver}-keccak"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/cgminer.service" "${pkgdir}/usr/lib/systemd/system/cgminer.service"
  install -Dm644 "${srcdir}/cgminer.conf.d" "${pkgdir}/etc/conf.d/cgminer"
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > cgminer.conf
  install -Dm644 cgminer.conf "${pkgdir}/etc/cgminer.conf"
}

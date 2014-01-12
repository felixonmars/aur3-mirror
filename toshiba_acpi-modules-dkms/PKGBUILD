# Maintainer: Bruno Aleci <brunoaleci@gmail.com>
_modulename=toshiba_acpi
pkgname=${_modulename}-modules-dkms
pkgver=1
pkgrel=0
pkgdesc="Toshiba ACPI kernel modules for Linux with patch for rfkill (DKMS)"

url="http://www.esperto-informatico.it"
arch=("x86_64" "i686")
license=("GPL")
depends=("dkms")

install=$pkgname.install
source=("http://www.esperto-informatico.it/uploads/${_modulename}/${_modulename}.tar.gz"
	"dkms.conf")

build() {
  cd              "${srcdir}"
  tar -xzvf       "${srcdir}/${_modulename}.tar.gz"

}

package() {
  mkdir -p        "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}"
  cp              "${srcdir}/${_modulename}/toshiba_acpi.c" "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}"
  cp              "${srcdir}/${_modulename}/Makefile" "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}"
  install -Dm644  "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${pkgname}-${pkgver}-${pkgrel}"
}

md5sums=('b8fc5998d468bae76076317c2fe366f8'
         'fa38e0298ef30f8a34f9252777fc479e')

# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

_pkgname="gnu-efi"
_ver="3.0"
_pkgver="${_ver}q"

pkgname="${_pkgname}"
pkgver="${_pkgver}"

pkgrel=1
pkgdesc="Library for building UEFI Applications using GNU toolchain"
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=()
depends=('pciutils')
options=(!strip)

source=("http://download.sourceforge.net/gnu-efi/gnu-efi_${pkgver}.orig.tar.gz")

sha256sums=('d48af548beb91bd0be3f905588c19650ed1ba114ccca047388f4aae50f471ff7')

build() {
	
	cd "${srcdir}/gnu-efi-${_ver}"
	
	sed 's|-fno-strict-aliasing|-fno-strict-aliasing -fno-stack-protector|g' -i "${srcdir}/gnu-efi-${_ver}/Make.defaults" || true
	
	CFLAGS="" make
	echo
	
	make -j1 -C apps clean all
	echo
	
}

package() {
	
	cd "${srcdir}/gnu-efi-${_ver}"
	
	make INSTALLROOT="${pkgdir}/usr/" install
	echo
	
	install -d "${pkgdir}/usr/share/gnu-efi/"
	install -D -m0644 "${srcdir}/gnu-efi-${_ver}/apps"/*.efi "${pkgdir}/usr/share/gnu-efi/"
	
}

# Maintainer: Dominik Heidler <dheidler@gmail.com>
pkgname=bladerf
pkgver=0.14.0
pkgrel=3
pkgdesc="Driver for bladeRF, allowing general purpose software defined radio (SDR)."
arch=('i686' 'x86_64')
url="https://github.com/Nuand/bladeRF"
license=('GPLv2')
depends=('libusb')
makedepends=('git' 'cmake')

#backup=("etc/bladerf.cfg")

_git_commit='300356bd50f4d2f0a334bde20d3a5b460a588a04'
_firmware_file='bladeRF_fw_v1.6.1.img'
_fpga_version='v0.0.3'

source=(
	"git://github.com/Nuand/bladeRF#commit=${_git_commit}"
	"http://www.nuand.com/fx3/${_firmware_file}"
	"hostedx40-${_fpga_version}.rbf::http://nuand.com/fpga/${_fpga_version}/hostedx40.rbf"
	"hostedx115-${_fpga_version}.rbf::http://nuand.com/fpga/${_fpga_version}/hostedx115.rbf"
	"88-bladerf.rules")

md5sums=('SKIP'
         '3cff9d6a2342fb70be9782e5413d4d8c'
         '6cedceae9048f1dfbec3dbd95239e869'
         '58e9fab16f2e9bcbb059116dbc44f39e'
         '062aefbf49fc9f9ec3e20b2994eeb8c2')

_extract_ver() {
	cat | head -n1 | sed -e "s/[^ ]* *\([0-9]*\))/\1/"
}

pkgver() {
	_MAJOR=`grep VERSION_INFO_MAJOR "$srcdir/bladeRF/host/libraries/libbladeRF/CMakeLists.txt" | _extract_ver`
	_MINOR=`grep VERSION_INFO_MINOR "$srcdir/bladeRF/host/libraries/libbladeRF/CMakeLists.txt" | _extract_ver`
	_PATCH=`grep VERSION_INFO_PATCH "$srcdir/bladeRF/host/libraries/libbladeRF/CMakeLists.txt" | _extract_ver`
	printf "%s.%s.%s" $_MAJOR $_MINOR $_PATCH
}

build() {
	cd "$srcdir/bladeRF/host"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DINSTALL_UDEV_RULES=OFF \
		-DBUILD_DOCUMENTATION=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr ../
	make
}

package() {
	cd "$srcdir/bladeRF/host/build"
	make DESTDIR=${pkgdir} install
	cd "$srcdir"
	install -vD -m644 88-bladerf.rules                  "${pkgdir}/usr/lib/udev/rules.d/88-bladerf.rules"
	install -vD -m644 "${_firmware_file}"               "${pkgdir}/usr/share/bladerf/firmware/${_firmware_file}"
	install -vD -m644 "hostedx40-${_fpga_version}.rbf"  "${pkgdir}/usr/share/bladerf/fpga/hostedx40.rbf"
	install -vD -m644 "hostedx115-${_fpga_version}.rbf" "${pkgdir}/usr/share/bladerf/fpga/hostedx115.rbf"
}

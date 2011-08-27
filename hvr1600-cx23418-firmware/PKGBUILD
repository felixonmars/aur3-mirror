# Contributor: Mike Redd <mredd@0tue0.com>
pkgname=hvr1600-cx23418-firmware
_pkgname=cx18-firmware
pkgver=0.0.73.0
pkgrel=1
pkgdesc="Conexant Firmware to cx23418 Chip - Hauppauge HVR-1600 adds for the CX18 Driver"
arch=('i686' 'x86_64')
url="http://dl.ivtvdriver.org/ivtv/firmware/"
license=('GPL')
source=($url$_pkgname.tar.gz)
md5sums=('667fa0ee6b79e054736beef922966333')
build() { 
cd "$srcdir/$_pkgname"
mkdir -p ${pkgdir}/lib/firmware
mkdir -p ${pkgdir}/usr/share/licenses/${_pkgname}
echo ""
echo "Conexant License"
echo "The cx23418 firmware files:"
echo ""
echo "v4l-cx23418-apu.fw"
echo "v4l-cx23418-cpu.fw"
echo "v4l-cx23418-dig.fw"
echo ""
echo "are covered by the following license:"
echo "Conexant grants permission to use and redistribute these firmware"
echo "files for use with Conexant devices, but not as a part of the Linux"
echo "kernel or in any other form which would require these files themselves"
echo "to be covered by the terms of the GNU General Public License."
echo "These firmware files are distributed in the hope that they will be"
echo "useful, but WITHOUT ANY WARRANTY; without even the implied warranty"
echo "of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."
echo ""
install -m 644 v4l-cx23418-apu.fw ${pkgdir}/lib/firmware
install -m 644 v4l-cx23418-cpu.fw ${pkgdir}/lib/firmware
install -m 644 v4l-cx23418-dig.fw ${pkgdir}/lib/firmware
install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}


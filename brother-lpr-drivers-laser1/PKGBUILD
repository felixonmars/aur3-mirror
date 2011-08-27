# Contributor: cdfk <cdfk1981-at-gmail.com>

pkgname=brother-lpr-drivers-laser1
pkgver=1.0.0
pkgrel=1
pkgdesc="This package provides all LPR drivers for models DCP-1000 DCP-1400 DCP-8020 DCP-8025D DCP-8040 DCP-8045D FAX-2850 FAX-2900 FAX-3800 FAX-4100 FAX-4750e FAX-5750e HL-1030 HL-1230 HL-1240 HL-1250 HL-1270N HL-1430 HL-1440 HL-1450 HL-1470N HL-1650 HL-1670N HL-1850 HL-1870N HL-5030 HL-5040 HL-5050 HL-5070N HL-5130 HL-5140 HL-5150D HL-5170DN HL-6050 HL-6050D MFC-4800 MFC-6800 MFC-8420 MFC-8440 MFC-8500 MFC-8820D MFC-8840D MFC-9030 MFC-9070 MFC-9160 MFC-9180 MFC-9660 MFC-9700 MFC-9760 MFC-9800 MFC-9860 MFC-9880"
license=('GPL' 'custom:brother commercial license')
url="http://solutions.brother.com/linux/en_us/index.html"
arch=('i686' 'x86_64')
[ $CARCH == "x86_64" ] && _a="amd64" && md5sums=(
  'cb07ffe232a2f9c97763eef2a69e529f') && depends=('brother-lpr-drivers-common' 'a2ps' 'lib32-glibc')
[ $CARCH == "i686" ] && _a="i386" && md5sums=(
  'e6d38f469da3b4cf6baf6ff2e3fed6d8') && depends=('brother-lpr-drivers-common' 'a2ps')
source=(http://mirrors.kernel.org/ubuntu/pool/multiverse/b/${pkgname}/${pkgname}_${pkgver}-3-0ubuntu4_${_a}.deb)

build() {
 cd $srcdir || return 1
 ar -x ${pkgname}_${pkgver}-3-0ubuntu4_${_a}.deb || return 1
 cd $pkgdir || return 1
 tar -xzf ${srcdir}/data.tar.gz || return 1
}

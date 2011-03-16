# $Id: PKGBUILD,v 1.25 2009/04/09 09:51:54 sergej Exp $
# Maintainer: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pulphix <pulphix@crazysource.org>

pkgname="qc-usb"
pkgver=0.6.6
pkgrel=19
pkgdesc="QuickCam Express Driver"
arch=('i686' 'x86_64')
url="http://qce-ga.sourceforge.net"
license=('GPL2')
depends=('kernel26')
makedepends=('kernel26-headers')
install='qc-usb.install'
source=("http://downloads.sourceforge.net/sourceforge/qce-ga/$pkgname-$pkgver.tar.gz"
	'qc-usb-0.6.6-kcompat-2.6.24.patch'
	'qc-usb-0.6.6-kcompat-2.6.26.patch'
	'qc-usb-0.6.6-kcompat-2.6.27.patch'
	'qc-usb-0.6.6-kcompat-2.6.28.patch'
	'qc-usb-0.6.6-kcompat-2.6.37.patch')
md5sums=('9eab8fb3a75326d1565d59b0c7256075'
         '6676d575b98bc5078f7886db45cb1107'
         '4e43b6a8e44470e7e919c7d3c362b27f'
         '6cd5ac406272dd88e38862043dd3233c'
         'de414ddb84ed15d5e353fc49f4162506'
         '6049764a50a68965c2f8bba390eb79e7')

build() {
  _kernver=`pacman -Q kernel26 | cut -d . -f 3 | cut -f 1 -d -`
  depends=("kernel26>=2.6.${_kernver}" "kernel26<2.6.`expr ${_kernver} + 1`")

  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i '../qc-usb-0.6.6-kcompat-2.6.24.patch'
  patch -Np1 -i '../qc-usb-0.6.6-kcompat-2.6.26.patch'
  patch -Np1 -i '../qc-usb-0.6.6-kcompat-2.6.27.patch'
  patch -Np1 -i '../qc-usb-0.6.6-kcompat-2.6.28.patch'
  patch -Np1 -i '../qc-usb-0.6.6-kcompat-2.6.37.patch'

  make all

  install -D -m644 quickcam.ko "${pkgdir}/lib/modules/2.6.${_kernver}/kernel/drivers/usb/media/quickcam.ko"
  install -D -m755 qcset "${pkgdir}/usr/bin/qcset"
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='2.6.${_kernver}'/" "${startdir}/${pkgname}.install"
}

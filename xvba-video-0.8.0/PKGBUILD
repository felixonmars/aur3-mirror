#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=xvba-video-0.8.0
pkgver=0.8.0
pkgrel=1
pkgdesc="AMDs XvBA backend for VA-API, hardware video acceleration on RadeonHD cards"
arch=('i686' 'x86_64')
url="http://www.splitted-desktop.com/~gbeauchesne/xvba-video/"
depends=('catalyst>=10.12' 'libva')
license=('GPL')
source=(http://www.splitted-desktop.com/~gbeauchesne/xvba-video/xvba-video-${pkgver}.${CARCH}.tar.gz)

if [ "${CARCH}" == "x86_64" ]; then
md5sums=('cdc84ddac2f7d80b7aaf3f50d3626d77')
else
md5sums=('7d2c7bda38d9a18ac3a1d363af46e01d')
fi


package() {
cd ${srcdir}/xvba-video-${pkgver}.${CARCH}

# driver
install -m755 -d "${pkgdir}/usr/lib/dri"
install -m755 -t "${pkgdir}/usr/lib/dri" usr/lib/va/drivers/*

# documentation
install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
install -m755 -t "${pkgdir}/usr/share/doc/${pkgname}" AUTHORS COPYING NEWS README
} 

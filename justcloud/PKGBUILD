# Maintainer: Feragon <feragon57@gmail.com>
pkgname=justcloud
pkgver=3.3.0.15
pkgrel=1
pkgdesc="Online backup for your computer"
arch=('i686' 'x86_64')
url="http://www.justcloud.com"
license=('GPL')
makedepends=('binutils')

if [ "${CARCH}" = 'x86_64' ]; then
   depends=('lib32-gtk2' 'lib32-libpng12' 'lib32-sqlite' 'dmidecode')
   _arch='64'
   md5sums=('45a58d8da83c2018358d7d90224a59ec'
	    '7115291dcd25bd463af275f0c29d5e2f')
elif [ "${CARCH}" = 'i686' ]; then
   depends=('gtk2' 'libpng12' 'sqlite' 'dmidecode')
   _arch='32'
   md5sums=('47664a8c8b4fda5e3dc53be5eb5d67ec'
	    '7115291dcd25bd463af275f0c29d5e2f')
fi

source=(http://cdn.backupgrid.net/JustCloud_${_arch}.deb ${pkgname}.sh)
build() {
  cd ${srcdir}
  install -dm775 -g users ${pkgdir}/opt/JustCloud  
  ar -x "JustCloud_${_arch}.deb"
  rm ${srcdir}/{control.tar.gz,debian-binary}
  tar -zxf "${srcdir}/data.tar.gz"
  cp -a ${srcdir}/opt/_--_BRAND_--_/*  ${pkgdir}/opt/JustCloud
  chmod -R 775 ${pkgdir}/opt/JustCloud
  chown -R :users ${pkgdir}/opt/JustCloud
  install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
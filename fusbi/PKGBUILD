# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=fusbi
pkgver=0.3.1
pkgrel=2
pkgdesc="create usb or hdd images from free gnu/linux iso's"
arch=(i686)
url="http://aligunduz.org/FUSBi/"
license=('GPL')
depends=('syslinux' 'p7zip' 'qt')
source=('http://aligunduz.org/FUSBi/releases/FUSBi-0.3.1_GNU-Linux')
md5sums=('ead23e34474f8b4b4078f5498732aa3c')

build() {
  cd "$srcdir"

  mv FUSBi-0.3.1_GNU-Linux fusbi

  install -Dm755 fusbi $pkgdir/usr/bin/fusbi

}

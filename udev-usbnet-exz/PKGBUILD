pkgname=udev-usbnet-exz
pkgver=1.0
pkgrel=1
url='http://heaven7.openflow.ru'
pkgdesc='udev rules for automatization actions usbnet motorolla devices (Motorola 1200 & etc...) Until only address assignment'
arch=('i686' 'x86_64')
license=('GPL')

source=('10-moto-ezx-usbnet.rules')
md5sums=('f5cc44f39df31e563d149d4acfd7c2a2')

build() {
  mkdir -p "${pkgdir}/etc/udev/rules.d"
  cp "${srcdir}/10-moto-ezx-usbnet.rules" "${pkgdir}/etc/udev/rules.d"
}

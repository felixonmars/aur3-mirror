#Mantainer Renan Manola
pkgname=8192cu
pkgver=3.3.2.3192.20120103
pkgrel=1
pkgdesc="Drivers for realtek RTL8188CUS chipset wireless cards"
arch=('i686' 'x86_64')
url="http://218.210.127.131/downloads/downloadsView.aspx?Langid=1&PNid=21&PFid=48&Level=5&Conn=4&DownTypeID=3&Downloads=true"
depends=('kernel26')
makedepends=('kernel26-headers')
license='unknown'
install='install.8192cu'
md5sums=('01e6881a1877b25e66bb9e0127eb7e73')
fileprefix=''

source=("http://fichiers.touslesdrivers.com/33235/RTL819xCU_USB_linux_%20v3%5B1%5D.3.2_3192.zip")

build() {
  cd "${srcdir}/RTL8188C_8192C_8192D_USB_linux_v3.3.2_3192.20120103/driver"
  tar xvf rtl8188C_8192C_8192D_usb_linux_v3.3.2_3192.20120103.tar.gz
  cd rtl8188C_8192C_8192D_usb_linux_v3.3.2_3192.20120103
  make
}
package() {
  mkdir -p "${pkgdir}/lib/modules/`uname -r`/kernel/drivers/net/wireless/"
  cd "${srcdir}/RTL8188C_8192C_8192D_USB_linux_v3.3.2_3192.20120103/driver/rtl8188C_8192C_8192D_usb_linux_v3.3.2_3192.20120103/"
  install -p -m 644 8192cu.ko  "${pkgdir}/lib/modules/`uname -r`/kernel/drivers/net/wireless/"
}

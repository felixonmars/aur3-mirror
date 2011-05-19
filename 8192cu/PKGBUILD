#Mantainer Renan Manola
pkgname=8192cu
pkgver=2.0.1324
pkgrel=1
pkgdesc="Drivers for realtek RTL8188CUS chipset wireless cards"
arch=('i686' 'x86_64')
url="http://218.210.127.131/downloads/downloadsView.aspx?Langid=1&PNid=21&PFid=48&Level=5&Conn=4&DownTypeID=3&Downloads=true"
depends=('kernel26')
makedepends=('kernel26-headers')
license='unknown'
install='install.8192cu'
md5sums=('427bd8a8422b65223feb0198b22eb444' 'f61d3d72f27cec8717f42cbb7d9d8767')
fileprefix=''
source=("http://fichiers.touslesdrivers.com/realtek/RTL8188CUS_linux_v2.0.1324.zip"
	"usb_intf.patch")

build() {

  cd ${srcdir}/RTL8192CU_8188CUS_8188CE-VAU_linux_v2.0.1324.20110126/driver
  tar xvf rtl8192CU_linux_v2.0.1324.20110126.tar.gz
  cd rtl8192CU_linux_v2.0.1324.20110126
  #it will not build without this sed
  sed "s#init_MUTEX(pmutex)#sema_init(pmutex,1)#" -i os_dep/osdep_service.c
  patch os_dep/linux/usb_intf.c < ./../../../usb_intf.patch
  make
}
package() {
  mkdir -p ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/net/wireless/
  cd ${srcdir}/RTL8192CU_8188CUS_8188CE-VAU_linux_v2.0.1324.20110126/driver/rtl8192CU_linux_v2.0.1324.20110126/
  install -p -m 644 8192cu.ko  ${pkgdir}/lib/modules/`uname -r`/kernel/drivers/net/wireless/
} 

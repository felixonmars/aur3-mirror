# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=ez100pu-driver
pkgver=1.4.9
pkgrel=1
pkgdesc="A driver for the ez100 smart card readers."
arch=('i686' 'x86_64')
url="http://www.casauto.com.tw/in-products-03.aspx?id=P_00000055"
license="unknown"
source=('http://www.casauto.com.tw/db/pictures/modules/PDT/PDT060207001/2009102020151530195.gz')
md5sums=('0f884dbd3980dc5127ebe66835411bb9')
backup=()
pre_install=('check_env')

build() {
  cd "$srcdir"
#  if [sh check_env | grep "Check OK" == "Environment Check OK!"] ; then
#	msg "Environment Check OK!"
#  else
#	msg "Environement Check failed!
#	If the screen shows 'PC/SC Daemon Not Ready', please goto the website 
#	http://www.linuxnet.com/middle.html to download and install the pcsclite package.
#	If the scrren shows 'Error! USB Device File System Not Mounted', please mount USB
#	file system according to the instruction.
#
#	Notes: If the script cannot execute, please use 'chmod 777 check_env' to change it 
#	to executable file."
#	stop
#  fi
}
package () {
  mkdir -p $srcdir/usr/local/pcsc/drivers/ezusb.bundle/Contents/Linux
  cp EZUSB_Linux_x86_v1.4.9/driver_ezusb_v1.4.9/drivers/ezusb.so $srcdir/usr/local/pcsc/drivers/ezusb.bundle/Contents/Linux/
  cp EZUSB_Linux_x86_v1.4.9/driver_ezusb_v1.4.9/drivers/Info.plist $srcdir/usr/local/pcsc/drivers/ezusb.bundle/Contents/ 
  mkdir -p $srcdir/usr/lib/pcsc/drivers/ezusb.bundle/Contents/Linux
  cp EZUSB_Linux_x86_v1.4.9/driver_ezusb_v1.4.9/drivers/ezusb.so $srcdir/usr/lib/pcsc/drivers/ezusb.bundle/Contents/Linux/
  cp EZUSB_Linux_x86_v1.4.9/driver_ezusb_v1.4.9/drivers/Info.plist $srcdir/usr/lib/pcsc/drivers/ezusb.bundle/Contents/ 

  msg "You need to reboot the system to use the driver!"
  msg "After reboot, insert a card. If the led of the reader turns red, the installation 
       of EZUSB driver is successful.

   Notice: 1. The recommaned version of kernel is 2.4 or higher.
           2. If you have installed EZUSB driver v1.3.4 or lower, please reinstall it first 
              before executing 'install' program.
              To uninstall v1.3.4 or lower, remove the settings of EZUSB driver in the 
              /etc/reader.conf.
           3. The driver requires PCSCLITE with being building with libusb. If PCSCLITE built 
              with libhal, the driver will not work."
}

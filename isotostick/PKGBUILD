# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=isotostick
pkgver=0.1
pkgrel=3
pkgdesc="A handy tool for making a bootable usb key out of an ISO image."
arch=('i686' 'x86_64')
url="http://www.startx.ro/"
license=('GPL2')
depends=('udev' 'syslinux')
source=(http://download.ubuntu-fr-secours.org/isotostick.sh)
md5sums=('947620b215805f0552cedb9c51cdea54')

build() {

sed -i s,udevinfo\ -q\ path\ -n\ ,udevadm\ info\ --query=path\ --name=,g $startdir/src/isotostick.sh
sed -i s,/lib/udev/vol_id,/lib/initcpio/udev/vol_id,g $startdir/src/isotostick.sh
install -D -m755 $startdir/src/isotostick.sh $startdir/pkg/usr/bin/isotostick 

}

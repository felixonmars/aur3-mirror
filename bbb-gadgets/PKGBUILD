# Maintainer: Brice Waegeneire  < brice dot wge at gmail dot com >

pkgname=bbb-gadgets
pkgver=20130905
pkgrel=3
pkgdesc="Units to initialize usb gadgets for the BeagleBone Black"
arch=('any')
url="http://www.beagleboard.org/"
license=('MIT')
makedepends=('git')
depends=('bash' 'systemd' 'dhcp' 'devmem')
backup=('etc/dhcpd-usb0.conf')
source=('dhcpd-usb0.conf'
	'g-ether-load.sh'
	'LICENSE'
	'network-gadget-init.service'
	'storage-gadget-init.service')       
sha256sums=('fbdd96a314618d71b42a703aa1ee6746c02619105417a7ffa44a5852d37502f9'
            '84183330e0e02ed9229bfa8d9803851d91b18f1aa07aeadeee189322268f640b'
            'a3cf78761a26fb2c850aec855708e83f808617c0c9c4620db58f06cbd2ce4d36'
            '56fb820f0fa844cf3e65f1adc88d60552ab7e602cd00cd5068bdc359d50042db'
            'f7437cac944bee954125ee610a0a039307b71bd85f852af63a345e977a2f633f')


package() {
  install -d $pkgdir/usr/lib/systemd/system
  install -m 0644 $srcdir/*.service $pkgdir/usr/lib/systemd/system
  
  install -D -m 0644 $srcdir/dhcpd-usb0.conf $pkgdir/etc/dhcpd-usb0.conf
  
  install -D -m 0755 $srcdir/g-ether-load.sh $pkgdir/usr/bin/g-ether-load.sh

  install -D -m 0644 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


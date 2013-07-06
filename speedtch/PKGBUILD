# Maintainer: 
# Contributor: dibblethewrecker <dibblethewrecker.at.jiwe.org>

pkgname=speedtch
pkgver=0.7
pkgrel=4
pkgdesc="Scripts and firmware for speedtouch modems"
arch=('any')
url="http://www.linux-usb.org/SpeedTouch"
license=('unknown')
depends=('ppp' 'udev')
backup=(etc/ppp/peers/speedtch)
install=$pkgname.install
source=($pkgname.peers
        $pkgname.hotplug
        http://steve-parker.org/speedtouchconf/rev4fw.zip)
md5sums=('5b221758895ac0269204effba214fb1e'
         '62f05a3c8603d4aeb10504ae9b39532d'
         '68e3765967c1fa62fc2211e12d9425dd')

package() {
  cd "$srcdir"

  install -Dm755 $pkgname.hotplug "$pkgdir"/etc/hotplug/usb/$pkgname
  install -Dm644 $pkgname.peers "$pkgdir"/etc/ppp/peers/$pkgname
  install -Dm644 ZZZLP1.eni "$pkgdir"/usr/lib/firmware/$pkgname-1.bin
  install -Dm644 ZZZLP2.eni "$pkgdir"/usr/lib/firmware/$pkgname-2.bin
}

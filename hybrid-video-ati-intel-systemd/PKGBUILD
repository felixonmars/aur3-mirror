# Maintainer: Ignacio Butler < ibutler + aur at gmail com >
pkgname=hybrid-video-ati-intel-systemd
pkgver=20130729
pkgrel=1
pkgdesc="ATI-Intel hybrid graphics configurer for systemd"
arch=('any')
license=('custom')
depends=('xf86-video-ati' 'xf86-video-intel' 'grep' 'sed' 'systemd')
url="https://wiki.archlinux.org/index.php/Hybrid_graphics#ATI_Dynamic_Switchable_Graphics"
source=('radeon.conf' 
        'ati-intel-hybrid'
        'ati-intel-hybrid.service')
md5sums=('512d7f369ff4a5d5b1c50b955979e29d'
         '2d6ab18da198b2c58e61714d127ed934'
		 '59f4f3b82973786f6b8317fef174960f')
replaces=('hybrid-video-ati-intel')

install="hybrid-video-ati-intel-systemd.install"

build() {
  cd "$srcdir"
  install -d -m 755 "$pkgdir/etc/modprobe.d/"
  install -d -m 755 "$pkgdir/usr/bin"
  install -d -m 755 "$pkgdir/etc/systemd/system/"
  install -m 644 radeon.conf "$pkgdir/etc/modprobe.d/"
  install -m 754 $srcdir/ati-intel-hybrid $pkgdir/usr/bin/ati-intel-hybrid
  install -m 644 $srcdir/ati-intel-hybrid.service $pkgdir/etc/systemd/system/ati-intel-hybrid.service
}

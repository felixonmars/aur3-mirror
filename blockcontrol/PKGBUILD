# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

pkgname=blockcontrol
pkgver=1.6.9
pkgrel=3
pkgdesc="blockcontrol is designed to do all tasks related to IP block daemons (MoBlock or NFBlock). They check internet traffic based on large lists of IP address ranges in order to protect your privacy."
arch=('i686' 'x86_64')
url="http://moblock-deb.sourceforge.net/"
license=('GPL2' 'BSD')
depends=('moblock' 'wget')
backup=('etc/blockcontrol/blockcontrol.conf'
        'etc/blockcontrol/blocklists.list')
source=("http://downloads.sourceforge.net/moblock-deb/$pkgname-$pkgver.tar.gz" \
        'blockcontrol.lib.patch')
md5sums=('d02002745aacf6100ff9057bdc80adf3' \
         'efcca84e52ea98cc10610830f9c2ba37')

package() {  
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i $srcdir/blockcontrol.lib.patch
  
  install -D -m 755 $srcdir/$pkgname-$pkgver/blockcontrol ${pkgdir}/usr/bin/blockcontrol
  install -D -m 755 $srcdir/$pkgname-$pkgver/blockcontrol.main ${pkgdir}/usr/lib/blockcontrol/blockcontrol.main
  install -D -m 644 $srcdir/$pkgname-$pkgver/blockcontrol.defaults ${pkgdir}/usr/lib/blockcontrol/blockcontrol.defaults
  install -D -m 644 $srcdir/$pkgname-$pkgver/blockcontrol.lib ${pkgdir}/usr/lib/blockcontrol/blockcontrol.lib
  install -D -m 755 $srcdir/$pkgname-$pkgver/blockcontrol.wd ${pkgdir}/usr/bin/blockcontrol.wd
  install -D -m 644 $srcdir/$pkgname-$pkgver/allow.p2p ${pkgdir}/etc/blockcontrol/allow.p2p
  install -D -m 644 $srcdir/$pkgname-$pkgver/blockcontrol.conf ${pkgdir}/etc/blockcontrol/blockcontrol.conf
  install -D -m 644 $srcdir/$pkgname-$pkgver/blocklists.list ${pkgdir}/etc/blockcontrol/blocklists.list
  install -D -m 755 $srcdir/$pkgname-$pkgver/cron.daily ${pkgdir}/etc/cron.daily/blockcontrol
  install -D -m 755 $srcdir/$pkgname-$pkgver/init ${pkgdir}/etc/rc.d/blockcontrol
  install -D -m 644 $srcdir/$pkgname-$pkgver/logrotate ${pkgdir}/etc/logrotate.d/blockcontrol
  install -d ${pkgdir}/var/lib/blockcontrol
  install -d ${pkgdir}/var/spool/blockcontrol
}

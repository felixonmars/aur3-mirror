#Contributor: Ashok `ScriptDevil` Gautham <ScriptDevil@gmail.com>
pkgname=trafmetux
pkgver=0.1.6
pkgrel=2
pkgdesc="A Traffic Meter for Linux."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/trafmetux/"
license=('GPL')
depends=('iptables-trafmetux' 'cron')
install='trafmetux.install'
source=('http://downloads.sourceforge.net/trafmetux/trafmetux-0.1.6.tar.gz' 'trafmetux.install' 'trafmetux.cron')

md5sums=('e446731ef7097931c5ed6fae5c4d7962'
         'ca653948d579c66641fc6409df7f239f'
         '9549df0713abb82a345bd79e747371f1')
build() {
  cd $srcdir/$pkgname-$pkgver/kernel-module
  make
  install -D xt_TRAFMETUX.ko $pkgdir/lib/modules/$(uname -r)/net/xt_TRAFMETUX.ko
  
  cd $srcdir/$pkgname-$pkgver/trafmetux-src
  make
  install -D -m755 trafmetux $pkgdir/usr/sbin/trafmetux
  
  install -D -m755 $srcdir/trafmetux.cron $pkgdir/etc/cron.d/trafmetux.cron
}



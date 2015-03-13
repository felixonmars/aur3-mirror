# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Someone else before me

pkgname=bcron
pkgver=0.10
pkgrel=6
pkgdesc="cron system designed with secure operations in mind"
arch=('i686')
url="http://www.untroubled.org/bcron/"
license=("GPL")
depends=('glibc' 'runit' 'freedt')
makedepends=('bglibs')
conflicts=('dcron')
replaces=('dcron' 'cron')
provides=('cron' 'dcron')
install=bcron.install
source=(http://www.untroubled.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('35b86f020c3b4333c84ade28fb4630df')


prepare() {
  cd $srcdir/$pkgname-$pkgver
  patch -p1 -i ../bcron-ucspi-ipc.patch
}

package() {
  cd $srcdir/$pkgname-$pkgver
  echo "/usr/lib/bglibs/include" > conf-bgincs
  echo "/usr/lib/bglibs/lib" > conf-bglibs
  echo "$pkgdir/usr/bin" > conf-bin
  make

  install -d $pkgdir/usr/man/man8
  install -d $pkgdir/usr/man/man5

  install -m0644 *.8 $pkgdir/usr/man/man8
  install -m0644 *.5 $pkgdir/usr/man/man5

  install -d $pkgdir/usr/bin

  install -m0755 bcron-exec   $pkgdir/usr/bin
  install -m0755 bcron-sched  $pkgdir/usr/bin
  install -m0755 bcron-spool  $pkgdir/usr/bin
  install -m0755 bcron-start  $pkgdir/usr/bin
  install -m0755 bcron-update $pkgdir/usr/bin
  install -m0755 bcrontab     $pkgdir/usr/bin

  install -d $pkgdir/var/spool/cron/crontabs
  install -d $pkgdir/var/spool/cron/tmp
  mkfifo $pkgdir/var/spool/cron/trigger
  install -d $pkgdir/etc/bcron

  install -d $pkgdir/etc/{cron.hourly,cron.daily,cron.weekly,cron.monthly}
  install -d $pkgdir/etc/cron.d

  install -D -m0600 ../root.crontab $pkgdir/var/spool/cron/crontabs/root
  touch $pkgdir/etc/crontab
  chmod 700 $pkgdir/etc/crontab

  ln -s bcrontab $pkgdir/usr/bin/crontab

  install -d $pkgdir/etc/sv
  cd $srcdir/sv
  cp -Rpv * $pkgdir/etc/sv
}

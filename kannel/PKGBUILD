# Maintainer: Rudy Matela <rudy@matela.com.br>
# Original Contributor: Essien Ita Essien <me@essienitaessien.com>

pkgname=kannel
pkgver=1.5.0
pkgrel=3
pkgdesc="Opensource WAP/SMS Gateway"
url="http://www.kannel.org"
license=("custom:KSL")
arch=(i686 x86_64)
depends=('libxml2>=2.2.5' 'libmysqlclient' 'postgresql-libs')
makedepends=(sqlite3)
conflicts=(kannel-mbuni)
provides=(kannel)
groups=(wasp-core)
backup=(etc/kannel/kannel.conf)
source=(http://www.kannel.org/download/$pkgver/gateway-$pkgver.tar.bz2
        kannel.conf modems.conf smsbox.conf wapbox.conf smsc.conf sendsms-user.conf sms-service.conf
        bearerbox.service smsbox.service wapbox.service
        COPYING)
md5sums=('7809cccaef27d1fad07618831e0ef4b5'
         'c600bc5f10c366467b20a2669e88a478'
         '8420dd67817fbbbcd25cf22375c750de'
         'c847b4c71c53434fe215c694a861716b'
         '2be848c4af28c5b62707e8db3bb1e7c5'
         '4efdd09e08d7e1491b6b578e81219d80'
         '009538b72eedf61682567c63cdcde531'
         '904c0f74de53559e2e109d5d619a2f63'
         '7463082111388bbdd4223164695a84aa'
         'b805c99ed83f25587cffef70dc7f8918'
         '285aae5e5f9db479fafb90de14e3d7a4'
         '03e9fa6510e7957e651adbe338deabd2')

build() {
  cd $srcdir/gateway-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --with-pgsql --with-mysql
  make
}

package() {
  cd $srcdir/gateway-$pkgver
  make DESTDIR=$pkgdir install
  make DESTDIR=$pkgdir install-test

  install -D -m 664 $srcdir/kannel.conf $pkgdir/etc/kannel/kannel.conf
  install -D -m 664 $srcdir/modems.conf $pkgdir/etc/kannel/modems.conf
  install -D -m 664 $srcdir/smsbox.conf $pkgdir/etc/kannel/smsbox.conf
  install -D -m 664 $srcdir/wapbox.conf $pkgdir/etc/kannel/wapbox.conf
  install -D -m 664 $srcdir/smsc.conf $pkgdir/etc/kannel/smsc.conf
  install -D -m 664 $srcdir/sendsms-user.conf $pkgdir/etc/kannel/sendsms-user.conf
  install -D -m 664 $srcdir/sms-service.conf $pkgdir/etc/kannel/sms-service.conf

  install -D -m 664 $srcdir/bearerbox.service $pkgdir/usr/lib/systemd/system/bearerbox.service
  install -D -m 664 $srcdir/smsbox.service    $pkgdir/usr/lib/systemd/system/smsbox.service
  install -D -m 664 $srcdir/wapbox.service    $pkgdir/usr/lib/systemd/system/wapbox.service

  install -D -m 644 $srcdir/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING

  mkdir -p $pkgdir/var/log/kannel/
}


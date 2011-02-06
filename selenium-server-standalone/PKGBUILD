pkgname=selenium-server-standalone
pkgver=2.0b1
pkgrel=1
pkgdesc="selenium server"
arch=(any)
url="http://seleniumhq.org/"
license=('APACHE')
depends=(java-runtime)
backup=(etc/conf.d/selenium-server.conf)
noextract=(selenium-server-standalone-$pkgver.jar)
source=(http://selenium.googlecode.com/files/selenium-server-standalone-$pkgver.jar
	selenium-server.conf.d
	selenium-server.rc)
md5sums=('24d6f099ef9f8ed49e6af2010e004284'
         'eb13d0dc8284fc2f285cde66e991fad4'
         'eebf224a2529c2563cc7342245a7fe08')

build() {
  cd "$srcdir"
  install -D -m0644 selenium-server-standalone-$pkgver.jar \
	$pkgdir/usr/share/selenium-server/selenium-server-standalone.jar
  install -D -m0644 selenium-server.conf.d $pkgdir/etc/conf.d/selenium-server.conf
  install -D -m0755 selenium-server.rc $pkgdir/etc/rc.d/selenium-server
}

pkgname=selenium-server-standalone
pkgver=2.20.0
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
md5sums=('b43009633862e2693e6e2d6d0bd039ba'
         '52d7774f2997c16a7e6b7672ae40d6ca'
         'ca9ee88f1b527db010980cdacb77e371')


build() {
  cd "$srcdir"
  install -D -m0644 selenium-server-standalone-$pkgver.jar \
	$pkgdir/usr/share/selenium-server/selenium-server-standalone.jar
  install -D -m0644 selenium-server.conf.d $pkgdir/etc/conf.d/selenium-server.conf
  install -D -m0755 selenium-server.rc $pkgdir/etc/rc.d/selenium-server
}

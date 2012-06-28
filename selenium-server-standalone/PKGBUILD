# Maintainer: Erik van der Kolk <developer at smerik dot nl>
# Contributor: Tim Diels <limyreth at gmail dot com>
# Contributor: Sergej Pupykin <arch at sergej dot pp dot ru>
pkgname=selenium-server-standalone
pkgver=2.24.1
pkgrel=1
pkgdesc="Test automation server for web applications"
arch=('any')
url="http://seleniumhq.org/"
license=('APACHE')
depends=('java-runtime>=6')
backup=('etc/conf.d/selenium-server.conf')
source=("http://selenium.googlecode.com/files/selenium-server-standalone-$pkgver.jar"
        'selenium-server.conf.d'
        'selenium-server.rc')
noextract=("selenium-server-standalone-$pkgver.jar")
md5sums=('d32d04992a1b7b224e59bafbe7a7e0c3'
         '7bee6e2fc552545326308483ee971b8f'
         '357a5bcd7966bce372bc776e834ff80b')

build() {
  cd "$srcdir"
  install -D -m0644 selenium-server-standalone-$pkgver.jar \
    $pkgdir/usr/share/selenium-server/selenium-server-standalone.jar
  install -D -m0644 selenium-server.conf.d $pkgdir/etc/conf.d/selenium-server.conf
  install -D -m0755 selenium-server.rc $pkgdir/etc/rc.d/selenium-server
}

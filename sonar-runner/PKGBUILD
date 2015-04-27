# Maintainer: Atsushi Ichiki <hitotuky at gmail dot com>
# Contributor: Tomasz Żok <tomasz.zok[at]gmail.com>
pkgname=sonar-runner
pkgver=2.4
pkgrel=0
pkgdesc="A tool to analyze projects with Sonar"
arch=(any)
url="http://sonar-plugins.codehaus.org"
license=('LGPL3')
depends=(java-runtime sh sonarqube)
source=(http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/${pkgver}/sonar-runner-dist-${pkgver}.zip)
md5sums=('f562528f93dbe6976a01c503da87a509')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d $pkgdir/opt/$pkgname/
  install -d $pkgdir/usr/bin/
  cp -r bin/ conf/ lib/ $pkgdir/opt/$pkgname/
  echo '#! /bin/sh' >> $pkgdir/usr/bin/$pkgname
  echo 'exec /opt/sonar-runner/bin/sonar-runner $@' >> $pkgdir/usr/bin/$pkgname
  chmod a+x $pkgdir/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
